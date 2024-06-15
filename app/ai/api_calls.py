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
    "id": 0
  }
]
'''


data_json = json.loads(data_string)

def generate_anthropic(prompt, cars_list):
    
    top = 10
    client = auth.connect_to_anthropic()
    query = f'''
    You are a company secretary that only speaks in JSON. Do not generate output that isn’t in properly formatted JSON. The response shouldn't have a json tag or any other tag.
    Analyze this list of cars: {cars_list} and the users prompt :{prompt} and return the best {top} cars that will suit you and format the response in {data_json} format. 
  '''
    
    message = client.messages.create(
        model='claude-3-haiku-20240307',
        max_tokens=3000,
        temperature=0.0,
        messages=[{"role": "user", "content": query}]
    )
    response = json.loads(message.content[0].text)
    
    return response
    
