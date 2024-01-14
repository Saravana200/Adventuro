from fastapi import FastAPI
from querier import search,reverse_search_engine
from pydantic import BaseModel
from chatbot import chatbot_message 
import time
from pydantic import BaseModel
from fastapi import FastAPI
from fastapi.responses import JSONResponse
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
from PIL import Image
app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}



@app.get("/search")
async def read_items(tag: str=""):
    print(tag)
    output= await search(tag)
    return {"places":output}

class Chatbot(BaseModel):
    message: str |None=None

@app.get("/describeimage")
async def describe(url: str=""):
    print(url)
    return await reverse_search_engine(url)

@app.post("/chat")
async def chatbot_mssg(message:Chatbot):
    try:
        l = await chatbot_message(message.message)
        if len(l) < 3:
            return {"message": "insufficient data"}
        rating = l[1]
        best_time = l[2]
        del(l[1])
        del(l[1]) 
        return {"message": l[:10], "rating": rating, "best_time": best_time}
    except Exception as e:
        return {"message": "insufficient data"}

class TokenData(BaseModel):
    url:str
class WebsiteData(BaseModel):
    query: str

@app.post("/open-website")
async def open_website(website_data: WebsiteData):
    options = webdriver.ChromeOptions()
    options.add_argument("--headless") 
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)

    try:
        driver.get("https://www.google.co.in")
        image_option = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CLASS_NAME, "nDcEnd"))
        )
        driver.execute_script("arguments[0].click();",image_option)

        image_search_bar = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CLASS_NAME, "PXT6cd"))
        )
        image_search_bar.click()

        search_bar = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CLASS_NAME, "cB9M7"))
        )
        search_bar.send_keys(website_data.query)

        search_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CLASS_NAME, "Qwbd3"))
        )
        search_button.click()

        maps_loc_text = driver.find_element(By.CLASS_NAME, "DeMn2d").text if driver.find_elements(By.CLASS_NAME, "DeMn2d") else ""
        titles = [title.text for title in driver.find_elements(By.CLASS_NAME, "UAiK1e")][:3]

        if not maps_loc_text:  
            nouns_from_titles = []
            for title in titles:
                tagged_words = pos_tag(nltk.word_tokenize(title))
                nouns = [word for word, tag in tagged_words if tag in {'NN', 'NNS', 'NNP', 'NNPS'}]
                nouns_from_titles.extend(nouns)

            return {
                "message": "Website opened successfully!",
                "loc": "",  
                "titles": titles,
                "nouns_from_titles": nouns_from_titles
            }
        else:
            return {
                "message": "Website opened successfully!",
                "loc": maps_loc_text,
                "titles": titles
            }
    finally:
        driver.quit()  

        
class TokenData(BaseModel):
    source:str
    destination:str

@app.post("/flights")
async def get_flight_price(token_d: TokenData):
    try:
        source =token_d.source
        destination = token_d.destination



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
        return {"price": flight_price.text}

    except Exception as e:
        print(f"Error: {e}")
        return JSONResponse({"message": "No flights found to this place"}, status_code=404)