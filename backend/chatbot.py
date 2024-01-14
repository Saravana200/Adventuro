import nltk
from nltk.stem import WordNetLemmatizer
import json
import pickle
import numpy as np
from keras.models import load_model
import random
import asyncio

lemmatizer = WordNetLemmatizer()


async def clean_up_sentence(sentence):
    return [lemmatizer.lemmatize(word.lower()) for word in nltk.word_tokenize(sentence)]

async def bow(sentence, words, show_details=True):
    sentence_words = await clean_up_sentence(sentence)
    bag = [0] * len(words)
    for s in sentence_words:
        for i, w in enumerate(words):
            if w == s:
                bag[i] = 1
                if show_details:
                    print("found in bag: %s" % w)
    return np.array(bag)

async def predict_class(sentence, words, classes):
    p = await bow(sentence, words, show_details=False)
    loop = asyncio.get_event_loop()
    model = await loop.run_in_executor(None, load_model, r'C:\Users\Dell\Documents\GitHub\Bug_bashers\backend\model.h5')
    res = model.predict(np.array([p]))[0]
    ERROR_THRESHOLD = 0.15
    results = [[i, r] for i, r in enumerate(res) if r > ERROR_THRESHOLD]
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = []
    for r in results:
        return_list.append({"intent": classes[r[0]], "probability": str(r[1])})
    return return_list

async def getResponse(ints, intents_json):
    tag = ints[0]['intent']
    for i in intents_json['intents']:
        if i['tag'] == tag:
            return i['responses']
    return []

async def chatbot_message(input):
    with open(r'C:\Users\Dell\Documents\GitHub\Bug_bashers\backend\labels.pkl', 'rb') as file:
        classes = pickle.load(file)
    with open(r'C:\Users\Dell\Documents\GitHub\Bug_bashers\backend\texts.pkl', 'rb') as file:
        words = pickle.load(file)
    with open(r'C:\Users\Dell\Documents\GitHub\Bug_bashers\backend\processed_intents2.json', 'r') as file:
        intents = json.load(file)
    ints = await predict_class(input, words, classes)
    print(ints)
    return await getResponse(ints, intents)

