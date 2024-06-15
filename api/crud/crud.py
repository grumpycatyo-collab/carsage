from sqlalchemy.orm import Session
from sqlmodel import select

from . import schemas
from business.models import models

def get_car(db: Session, car_id : int):
    return db.query(models.Car).filter(models.Car.id == car_id).first()

def create_car(db: Session, car: schemas.CarCreate):
    db_car = models.Car(**car.dict())
    db.add(db_car)
    db.commit()
    db.refresh(db_car)
    return db_car


def get_cars(db: Session, make: str = None, bodytype: str = None, state: str = None,
             model: str = None, fuel: str = None, min_price: int = None, max_price: int = None,
             min_power: int = None, max_power: int = None, gearbox: str = None,
             color: str = None, upholstery: str = None, traction: str = None,
             min_grade: int = None, max_grade: int = None):
    query = db.query(models.Car)
    if make is not None:
        query = query.filter(models.Car.make == make)
    if bodytype is not None:
        query = query.filter(models.Car.bodytype == bodytype)
    if state is not None:
        query = query.filter(models.Car.state == state)
    if model is not None:
        query = query.filter(models.Car.model == model)
    if fuel is not None:
        query = query.filter(models.Car.fuel == fuel)
    if min_price is not None:
        query = query.filter(models.Car.price >= min_price)
    if max_price is not None:
        query = query.filter(models.Car.price <= max_price)
    if min_power is not None:
        query = query.filter(models.Car.power >= min_power)
    if max_power is not None:
        query = query.filter(models.Car.power <= max_power)
    if gearbox is not None:
        query = query.filter(models.Car.gearbox == gearbox)
    if color is not None:
        query = query.filter(models.Car.color == color)
    if upholstery is not None:
        query = query.filter(models.Car.upholstery == upholstery)
    if traction is not None:
        query = query.filter(models.Car.traction == traction)
    if min_grade is not None:
        query = query.filter(models.Car.grade >= min_grade)
    if max_grade is not None:
        query = query.filter(models.Car.grade <= max_grade)

    return query.all()