
import requests
from fastapi import FastAPI 
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
from PIL import Image
import re
import json
from llama_index.llms import MistralAI
from llama_index.llms import ChatMessage
import os

api_key = "LLhFAD8qALQeGFnd5F8nTciJyv2WejlT"
model = "mistral-tiny"


async def get_flight_price(src,dest):
    try:
        source =src
        destination = dest


        driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))

        driver.get("https://www.google.com/travel/flights")  # Replace with the actual URL

        element1=driver.find_element(By.XPATH, "/html/body/c-wiz[2]/div/div[2]/c-wiz/div[1]/c-wiz/div[2]/div[1]/div[1]/div[1]/div/div[2]/div[1]/div[1]/div/div/div[1]/div/div/input")

        element1.click()
        element1.clear()
        time.sleep(1)
        element1=driver.find_element(By.XPATH, "/html/body/c-wiz[2]/div/div[2]/c-wiz/div[1]/c-wiz/div[2]/div[1]/div[1]/div[1]/div/div[2]/div[1]/div[6]/div[2]/div[2]/div[1]/div/input")
        print("cleared")
        element1.send_keys(source)
        time.sleep(1)
        place1= driver.find_element(By.CLASS_NAME, "CwL3Ec")
        place1.click()
        

        time.sleep(1)
        element2=driver.find_element(By.XPATH, "/html/body/c-wiz[2]/div/div[2]/c-wiz/div[1]/c-wiz/div[2]/div[1]/div[1]/div[1]/div/div[2]/div[1]/div[4]/div/div/div[1]/div/div/input")

        element2.click()
        element2.clear()
        time.sleep(1)
        element2=driver.find_element(By.XPATH, "/html/body/c-wiz[2]/div/div[2]/c-wiz/div[1]/c-wiz/div[2]/div[1]/div[1]/div[1]/div/div[2]/div[1]/div[6]/div[2]/div[2]/div[1]/div/input")
        print("cleared")
        element2.send_keys(destination)
        time.sleep(2)
        place2= driver.find_element(By.CLASS_NAME, "w1ZvBc")
        place2.click()

        search_button=driver.find_element(By.XPATH,"/html/body/c-wiz[2]/div/div[2]/c-wiz/div[1]/c-wiz/div[2]/div[1]/div[1]/div[2]/div/button/span[2]")
        search_button.click()
        time.sleep(2)
        flight_price = driver.find_element(By.XPATH, "/html/body/c-wiz[2]/div/div[2]/c-wiz/div[1]/c-wiz/div[2]/div[2]/div[3]/ul/li[1]/div/div[2]/div/div[2]/div[6]/div[1]/div[2]/span")  # Find elements with the class names

        print(flight_price.text)
        return flight_price.text

    except Exception as e:
        print(f"Error: {e}")
        return "No flights found to this place"
    

async def reverse_search_engine(message):
    api_key = "LLhFAD8qALQeGFnd5F8nTciJyv2WejlT"
    if(message==None):
        return "Image not accessible"
    client = MistralAI(api_key=api_key)

    messages = [
        ChatMessage(role="user", content="suggest me simillar places like this"+message+" within 200 words")
    ]

    resp = client.chat(messages)
    return resp.message.content


def clean_html(raw_html):
    cleanr = re.compile('<.*?>')
    cleantext = re.sub(cleanr, '', raw_html)
    return cleantext

async def get_wikipedia_extract(title):
    url = 'https://en.wikipedia.org/w/api.php'
    params = {
        'action': 'query',
        'prop': 'extracts',
        'exintro': '',
        'titles': title,
        'format': 'json'
    }
    response = requests.get(url, params=params)
    data = response.json()
    page = next(iter(data['query']['pages'].values()))  
    extract_html = page.get('extract', 'No summary available')
    return clean_html(extract_html)

async def search(query):
    print("hiiiiiiii")
    l=[]
    auth={"Authorization":"Client-ID Sm3UKl6xYv_-RsXZQIv1rGw4A2aW957ShTrsl5g90js"}
    resp=requests.get("https://api.unsplash.com/search/photos?query="+query+"&per_page=3",headers=auth)
    url=resp.json()['results']
    for i in url:
        output = {}
        output["id"] = i["id"]
        try:
            location = requests.get("https://api.unsplash.com/photos/" + i["id"], headers=auth)
            location.raise_for_status()
            output["image_url"] = location.json()["urls"]["raw"]
            output["location"] = location.json().get("location", {})
            if list(output.values()).count(None) == 0 and list(output["location"].values()).count(None) == 0:
                output["description"]=await get_wikipedia_extract(output["location"]["country"])
                output["price"]=await get_flight_price("bengaluru",output["location"]["city"])
                l.append(output)
        except requests.exceptions.RequestException as e:
            print(f"Error fetching data for id {i['id']}: {e}")
    return l

