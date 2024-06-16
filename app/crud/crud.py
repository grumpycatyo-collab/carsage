from sqlalchemy.orm import Session
from sqlalchemy import func
from . import schemas
from business.models import models


def get_car(db: Session, car_id : int):
    return db.query(models.Car).filter(models.Car.id == car_id).first()

def get_cars(db: Session, skip: int = 0, limit: int = 100): #not tested
    return db.query(models.Car).offset(skip).limit(limit).all()

def create_car(db: Session, car: schemas.CarCreate):
    db_car = models.Car(**car.dict())
    db.add(db_car)
    db.commit()
    db.refresh(db_car)
    return db_car

def get_cars(db: Session, make: str = None, bodytype: str = None, state: str = None,
             model: str = None, fuel: str = None, min_price: int = None, max_price: int = None,
             min_power: int = None, max_power: int = None, gearbox: str = None,
             color: str = None, upholstery: str = None, traction: str = None, year: int = None, purpose: str = None,
             min_grade: int = None, max_grade: int = None, skip: int = 0, limit: int = 100):
    
    query = db.query(models.Car)
    
    if make:
        query = query.filter(models.Car.make == make)
    if bodytype:
        query = query.filter(models.Car.bodytype == bodytype)
    if state:
        query = query.filter(models.Car.state == state)
    if model:
        query = query.filter(models.Car.model == model)
    if fuel:
        query = query.filter(models.Car.fuel == fuel)
    if min_price:
        query = query.filter(models.Car.price >= min_price)
    if max_price:
        query = query.filter(models.Car.price <= max_price)
    if min_power:
        query = query.filter(models.Car.power >= min_power)
    if max_power:
        query = query.filter(models.Car.power <= max_power)
    if gearbox:
        query = query.filter(models.Car.gearbox == gearbox)
    if color:
        query = query.filter(models.Car.color == color)
    if upholstery:
        query = query.filter(models.Car.upholstery == upholstery)
    if traction:
        query = query.filter(models.Car.traction == traction)
    if min_grade:
        query = query.filter(models.Car.grade >= min_grade)
    if max_grade:
        query = query.filter(models.Car.grade <= max_grade)
    if year:
        query = query.filter(models.Car.year == year)
    if purpose:
        query = query.filter(models.Car.purpose == purpose)

    query = query.offset(skip).limit(limit)
    return query.all()





def get_cars_summary(db: Session):
    makes = db.query(models.Car.make).distinct().all()
    colors = db.query(models.Car.color).distinct().all()
    states = db.query(models.Car.state).distinct().all()
    purposes = db.query(models.Car.purpose).distinct().all()
    min_price = db.query(func.min(models.Car.price)).scalar()
    max_price = db.query(func.max(models.Car.price)).scalar()
    
    return {
        "makes": [make[0] for make in makes],
        "colors": [color[0] for color in colors],
        "states": [state[0] for state in states],
        "purposes": [purpose[0] for purpose in purposes],
        "min_price": min_price,
        "max_price": max_price
    }