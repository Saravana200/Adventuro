import requests
import json
import re

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
    # l=[]
    # auth={"Authorization":"Client-ID Sm3UKl6xYv_-RsXZQIv1rGw4A2aW957ShTrsl5g90js"}
    # resp=requests.get("https://api.unsplash.com/search/photos?query="+query+"&per_page=30",headers=auth)
    # url=resp.json()['results']
    # for i in url:
    #     output = {}
    #     output["id"] = i["id"]
    #     try:
    #         location = requests.get("https://api.unsplash.com/photos/" + i["id"], headers=auth)
    #         location.raise_for_status()
    #         output["image_url"] = location.json()["urls"]["raw"]
    #         output["location"] = location.json().get("location", {})
    #         if list(output.values()).count(None) == 0 and list(output["location"].values()).count(None) == 0:
    #             output["description"]=await get_wikipedia_extract(output["location"]["city"])
    #             l.append(output)
    #     except requests.exceptions.RequestException as e:
    #         print(f"Error fetching data for id {i['id']}: {e}")
    return [
    {
        "id": "QlYp-9ftH1w",
        "image_url": "https://images.unsplash.com/photo-1612908055990-6239a73d6fbd?ixid=M3w1NTE3NzN8MHwxfGFsbHx8fHx8fHx8fDE3MDUxODIwNDB8&ixlib=rb-4.0.3",
        "location": {
            "name": "Mount Donna Buang, Warburton VIC, Australia",
            "city": "Warburton",
            "country": "Australia",
            "position": {
                "latitude": -37.706944,
                "longitude": 145.680833
            }
        },
        "description": "Warburton may refer to\n"
    }]


    
    




