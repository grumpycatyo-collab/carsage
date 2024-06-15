from app.ai import auth
from app.crud import schemas
from typing import List
import json
from business.models import models

data_string = '''
[
  {
    "make": "string",
    "model": "string",
    "fuel": "string",
    "state": "string",
    "bodytype": "string",
    "price": 0,
    "power": 0,
    "torque": 0,
    "gearbox": "string",
    "color": "string",
    "upholstery": "string",
    "traction": "string",
    "grade": 0,
    "id": 0,
    "short_description": "string"
  }
]
'''

data_json = json.loads(data_string)

def generate_top_cars(prompt, cars_list):
    
    top = 10
    client = auth.connect_to_anthropic()
    query = f'''
    You are a company secretary that only speaks in JSON. Do not generate output that isn’t in properly formatted JSON. The response shouldn't have a json tag or any other tag.
    Analyze this list of cars: {cars_list} and the users prompt :{prompt} and return the best {top} cars that will suit you and format the response in {data_json} format. 
    For the "short_description" you should  generate a short 7-10 word description of the car. Your main attention should be on purpose parameter. 
    Make sure the response is original and for a user that doesn't know anything about cars.
    '''
    print(prompt)

    message = client.messages.create(
        model='claude-3-haiku-20240307',
        max_tokens=3000,
        temperature=0.0,
        messages=[{"role": "user", "content": query}]
    )
    response = json.loads(message.content[0].text)
    
    return response
    

def generate_long(car):
  client = auth.connect_to_anthropic()
  query = f'''
    Directly write the response.
    Generate a short 30-35 word description of the car {car}. You should talk about purpose, usefulness and suitability (look for the brand, price, make). Make sure the response is original and for a user that doesn't know anything about cars.
  '''
  message = client.messages.create(
        model='claude-3-haiku-20240307',
        max_tokens=3000,
        temperature=0.0,
        messages=[{"role": "user", "content": query}]
    )
  response = message.content[0].text

  return response
  
def generate_compare(car1, car2):
  client = auth.connect_to_anthropic()
  
  query = f'''
    Directly write the response.
    Compare the cars {car1} and {car2}. You should compare the price, power, fuel, and grade. As the response you should give me as a response only and only the "id" parameter of the car than won the comparison.
  '''
  
  message = client.messages.create(
        model='claude-3-opus-20240229',
        max_tokens=3000,
        temperature=0.0,
        messages=[{"role": "user", "content": query}]
    )
  
  response = message.content[0].text
  
  return response
  
