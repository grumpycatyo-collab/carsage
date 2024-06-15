from sqlalchemy.orm import Session

from . import schemas
from business.models import models


def get_car(db: Session, car_id : int):
    return db.query(models.Car).filter(models.Car.id == car_id).first()

# def get_users_by_hobby(db: Session, hobby: str):
#     return db.query(models.User).filter(models.User.hobby == hobby).all()   

def get_cars(db: Session, skip: int = 0, limit: int = 100): #not tested
    return db.query(models.Car).offset(skip).limit(limit).all()

def create_car(db: Session, car: schemas.CarCreate):
    db_car = models.Car(**car.dict())
    db.add(db_car)
    db.commit()
    db.refresh(db_car)
    return db_car