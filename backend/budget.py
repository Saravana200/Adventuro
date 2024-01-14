import time
from pydantic import BaseModel
from fastapi import FastAPI
from fastapi.responses import JSONResponse
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
class TokenData(BaseModel):
    source:str
    destination:str
    

app = FastAPI()



    # finally:
    #     driver.quit()
