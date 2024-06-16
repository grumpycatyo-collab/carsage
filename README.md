## How to start 

Make a venv:
```
pip install virtualenv
```
Then in the `carsage/` directory:
```
python3.11 -m venv carsagevenv
source carsagevenv/bin/activate
```

To install all necessary libs do:
```
 ~ pip install -r requirements.txt
```

If you have installed some libs then do this:
```
pip freeze > requirements.txt
```
To update the file.


## Main Documentation

Connect on `localhost:8000` if tunneling is not yet updated.

### Create car
#### `/api/v1/car/` POST
Payload:
```json
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
  "purpose": "string",
  "year": 0,
  "image_link": "string"
}
```

### Get car by ID
#### `/api/v1/car/{car_id}` GET
Request url:
`http://localhost:8000/api/v1/car/3`
Response example:
```json
{
  "make": "Toyota",
  "bodytype": "Coupe",
  "model": "Yaris",
  "state": "new",
  "fuel": "Gasoline",
  "power": 450,
  "gearbox": "Manual",
  "upholstery": "Leather",
  "grade": 9,
  "year": 2022,
  "id": 3,
  "price": 55000,
  "torque": 410,
  "color": "Black",
  "traction": "FWD",
  "purpose": "Personal",
  "image_link": "https://cdn.imagin.studio/getImage?angle=22&billingTag=web&customer=carwow&make=toyota&modelFamily=yaris&modelVariant=hatchback&modelYear=2024&paintDescription=metallic-decuma-grey&paintId=pspc0120&width=400&zoomLevel=0&zoomType=fullscreen",
  "long_description": "The Toyota Yaris Coupe is a sleek and powerful personal vehicle, perfect for those seeking a stylish and practical ride. With its 450 horsepower engine, manual gearbox, and leather upholstery, this car offers an exceptional driving experience at a reasonable price of $55,000."
}
```

### Get cars by prompt
#### `/api/v1/car/ai` GET
Request url:
`http://localhost:8000/api/v1/car/ai?prompt=I%20have%20a%20family`
Response example:
```json
[
  {
    "make": "Toyota",
    "model": "Highlander",
    "fuel": "Gasoline",
    "state": "used",
    "bodytype": "SUV",
    "price": 50000,
    "power": 295,
    "torque": 263,
    "gearbox": "Automatic",
    "color": "Blue",
    "upholstery": "Leather",
    "traction": "AWD",
    "grade": 8,
    "id": 17,
    "image_link": "https://car-data.carwow.co.uk/image?filter%5Bangle%5D=side&filter%5Bbrand_slug%5D=toyota&filter%5Bmodel_review_slug%5D=highlander-2021&zoomType=fullscreen&zoomLevel=0&billingTag=web&width=150",
    "purpose": "Family",
    "year": 2019,
    "short_description": "Spacious and capable family SUV with all-wheel drive."
  },
  {
    "make": "Volkswagen",
    "model": "Touareg",
    "fuel": "Diesel",
    "state": "new",
    "bodytype": "SUV",
    "price": 70000,
    "power": 231,
    "torque": 500,
    "gearbox": "Automatic",
    "color": "Green",
    "upholstery": "Leather",
    "traction": "AWD",
    "grade": 9,
    "id": 42,
    "image_link": "https://car-data.carwow.co.uk/image?filter%5Bangle%5D=side&filter%5Bbrand_slug%5D=volkswagen&filter%5Bmodel_review_slug%5D=touareg-2018&zoomType=fullscreen&zoomLevel=0&billingTag=web&width=150",
    "purpose": "Family",
    "year": 2023,
    "short_description": "Spacious and capable family SUV with all-wheel drive."
  }
]
```

### Get cars 
#### `/api/v1/cars` GET
Request url:
`http://localhost:8000/api/v1/cars?make=Toyota&max_price=100000&max_power=300&gearbox=Automatic&color=Red&year=2022&purpose=Personal&traction=FWD&min_grade=0&max_grade=7&skip=0&limit=2`
Response example (all the fields can be filters):
```json
[
  {
    "make": "Toyota",
    "model": "Corolla",
    "fuel": "Gasoline",
    "state": "new",
    "bodytype": "Sedan",
    "price": 30000,
    "power": 203,
    "torque": 250,
    "gearbox": "Automatic",
    "color": "Red",
    "upholstery": "Leather",
    "traction": "FWD",
    "grade": 7,
    "purpose": "Personal",
    "year": 2022,
    "image_link": "https://cdn.imagin.studio/getImage?angle=22&billingTag=web&customer=carwow&make=toyota&modelFamily=corolla&modelVariant=estate&modelYear=2024&paintDescription=solid-pure-white&paintId=pspc0323&width=400&zoomLevel=0&zoomType=fullscreen",
    "id": 1
  }
]
```

### Get cars comparison
#### `/api/v1/cars/compare` GET
Request url:
`http://localhost:8000/api/v1/cars/compare?car1=1&car2=4`
Response example :

```json
{
  "car1": {
    "id": 1,
    "state": "new",
    "price": 30000,
    "torque": 250,
    "color": "Red",
    "traction": "FWD",
    "purpose": "Personal",
    "image_link": "https://cdn.imagin.studio/getImage?angle=22&billingTag=web&customer=carwow&make=toyota&modelFamily=corolla&modelVariant=estate&modelYear=2024&paintDescription=solid-pure-white&paintId=pspc0323&width=400&zoomLevel=0&zoomType=fullscreen",
    "make": "Toyota",
    "bodytype": "Sedan",
    "model": "Corolla",
    "fuel": "Gasoline",
    "power": 203,
    "gearbox": "Automatic",
    "upholstery": "Leather",
    "grade": 7,
    "year": 2022
  },
  "car2": {
    "id": 4,
    "state": "new",
    "price": 37000,
    "torque": 360,
    "color": "White",
    "traction": "FWD",
    "purpose": "Personal",
    "image_link": "https://cdn.imagin.studio/getImage?angle=22&billingTag=web&customer=carwow&make=suzuki&modelFamily=swace&modelVariant=estate&modelYear=2024&paintDescription=solid-solid-super-white&paintId=pspc0041&width=400&zoomLevel=0&zoomType=fullscreen",
    "make": "Suzuki",
    "bodytype": "Hatchback",
    "model": "Swace",
    "fuel": "Gasoline",
    "power": 200,
    "gearbox": "Automatic",
    "upholstery": "Fabric",
    "grade": 6,
    "year": 2022
  },
  "result_id": "1"
}
```


### Get summary (filters)
#### `/api/v1/cars/summary` GET
Response:
```json
{
  "makes": [
    "Mercedes-Benz",
    "Honda",
    "Fiat",
    "Opel",
    "Ford",
    "Nissan",
    "Maserati",
    "Skoda",
    "Suzuki",
    "Citroen",
    "Peugeot",
    "Mazda",
    "BMW",
    "Dacia",
    "Volkswagen",
    "Porsche",
    "Alfa Romeo",
    "Audi",
    "Mercedes",
    "Tesla",
    "Jaguar",
    "Toyota",
    "Renault",
    "SEAT",
    "Kia"
  ],
  "colors": [
    "Orange",
    "Silver",
    "Yellow",
    "Green",
    "Red",
    "Grey",
    "White",
    "Black",
    "Blue"
  ],
  "states": [
    "needs investments",
    "drowned",
    "used",
    "new"
  ],
  "purposes": [
    "Personal",
    "Business",
    "Sport",
    "Electric",
    "Compact",
    "Utility",
    "Family",
    "Luxury"
  ],
  "min_price": 12000,
  "max_price": 100000
}
```