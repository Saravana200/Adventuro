from fastapi import FastAPI
from querier import search,randomize
import json
app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/search")
async def read_items(tag: str=""):
    print(tag)
    output= await search(tag)
    return output

@app.get("/random")
async def read_items(tag: str=""):
    print(tag)
    output= await randomize(tag)
    return output