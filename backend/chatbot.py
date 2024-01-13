import nltk
from nltk.stem import WordNetLemmatizer
lemmatizer = WordNetLemmatizer()
import json
import pickle
import numpy as np
from keras.models import Sequential,load_model
from keras.layers import Dense, Activation, Dropout
from keras.optimizers import SGD
import random
import sys


def clean_up_sentence(sentence):
    # tokenize the pattern - split words into array
    sentence_words = nltk.word_tokenize(sentence)
    # stem each word - create short form for word
    sentence_words = [lemmatizer.lemmatize(word.lower()) for word in sentence_words]
    return sentence_words
# return bag of words array: 0 or 1 for each word in the bag that exists in the sentence

def bow(sentence, words, show_details=True):
    # tokenize the pattern
    sentence_words = clean_up_sentence(sentence)
    # bag of words - matrix of N words, vocabulary matrix
    bag = [0]*len(words) 
    for s in sentence_words:
        for i,w in enumerate(words):
            if w == s: 
                # assign 1 if current word is in the vocabulary position
                bag[i] = 1
                if show_details:
                    print ("found in bag: %s" % w)
    return(np.array(bag))

def predict_class(sentence,words,classes):
    # filter out predictions below a threshold
    p = bow(sentence, words,show_details=False)
    model = load_model('model.h5')
    res = model.predict(np.array([p]))[0]
    ERROR_THRESHOLD = 0.25
    results = [[i,r] for i,r in enumerate(res) if r>ERROR_THRESHOLD]
    # sort by strength of probability
    results.sort(key=lambda x: x[1], reverse=True)
    return_list = []
    for r in results:
        return_list.append({"intent": classes[r[0]], "probability": str(r[1])})
    return return_list

def getResponse(ints, intents_json):
    tag = ints[0]['intent']
    list_of_intents = intents_json['intents']
    for i in list_of_intents:
        if(i['tag']== tag):
            result = i['responses']
            break
    return result

if __name__ == '__main__':
    # if len(sys.argv) != 2:
    #     print('Usage: python your_script.py <input_data_json>')
    #     sys.exit(1)


    inp = input("Enter query\n")
    classes = []
    words = []
    with open('labels.pkl', 'rb') as file:
        classes = pickle.load(file)
    with open('texts.pkl', 'rb') as file:
        words = pickle.load(file)
    json_data = open('processed_intents.json').read()
    intents = json.loads(json_data)
    ints = predict_class(inp,words,classes)
    print(ints)
    res = getResponse(ints, intents) 
    for r in range(len(res)):
        print(str(r+1) + res[r])
        print()