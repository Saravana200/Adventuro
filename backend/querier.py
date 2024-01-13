import requests
async def search(query):
    print("hiiiiiiii")
    l=[]
    auth={"Authorization":"Client-ID Sm3UKl6xYv_-RsXZQIv1rGw4A2aW957ShTrsl5g90js"}
    resp=requests.get("https://api.unsplash.com/search/photos?query="+query+"&per_page=30",headers=auth)
    url=resp.json()['results']
    for i in url:
        output={}
        output["id"]=i["id"]
        location=requests.get("https://api.unsplash.com/photos/"+i["id"],headers=auth)
        output["image_url"]=location.json()["urls"]["small"]
        output["location"]=location.json()["location"]
        print(output.values())
        if (list(output.values()).count(None)==0 and list(output["location"].values()).count(None)==0):
            l.append(output)
    return l

async def randomize(query):
    print("hiiiiiiii")
    l=[]
    auth={"Authorization":"Client-ID Sm3UKl6xYv_-RsXZQIv1rGw4A2aW957ShTrsl5g90js"}
    resp=requests.get("https://api.unsplash.com/photos/random?query="+query+"&count=30",headers=auth).json()
    print(resp)
    for i in resp:
        output={}
        output["id"]=i["id"]
        location=requests.get("https://api.unsplash.com/photos/"+i["id"],headers=auth)
        output["image_url"]=location.json()["urls"]["small"]
        output["location"]=location.json()["location"]
        print(output.values())
        if (list(output.values()).count(None)==0 and list(output["location"].values()).count(None)==0):
            l.append(output)
    return l

    
    




