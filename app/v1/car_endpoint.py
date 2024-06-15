import json
import logging as log
from sqlalchemy.orm import Session
from fastapi import APIRouter, HTTPException, Body, status, Depends, Query
from ..crud import crud, schemas
from business.models import models
from foundation.database import SessionLocal, engine
from fastapi.responses import JSONResponse
from typing import List
from ..ai import api_calls

models.Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

log.basicConfig(format='%(asctime)s %(levelname)s %(message)s', level='INFO')

router = APIRouter()

@router.post("/car/", response_model=schemas.Car)
def create_user(car: schemas.CarCreate, db: Session = Depends(get_db)):
    return crud.create_car(db=db, car=car)


@router.get("/car/{car_id}")
def read_car(car_id: int, db: Session = Depends(get_db)):
    db_car = crud.get_car(db, car_id=car_id)
    if db_car is None:
        raise HTTPException(status_code=404, detail="Car not found")
    
    car_dict = db_car.__dict__
    car_dict["long_description"] = api_calls.generate_long(car_dict)
    return car_dict


@router.post("/car/ai")
def get_car_by_prompt(prompt: str, db: Session = Depends(get_db)):
    db_cars = crud.get_cars(db)
    cars_list = list(map(lambda car: schemas.Car(**car.__dict__), db_cars))
    response = api_calls.generate_top_cars(prompt, cars_list)
    return response

@router.get("/cars/", response_model=List[schemas.Car])
def get_cars(
    skip: int = 0,
    limit: int = 100,
    make: str = None,
    bodytype: str = None,
    state: str = None,
    model: str = None,
    fuel: str = None,
    min_price: int = None,
    max_price: int = None,
    min_power: int = None,
    max_power: int = None,
    gearbox: str = None,
    color: str = None,
    upholstery: str = None,
    traction: str = None,
    min_grade: int = None,
    max_grade: int = None,
    db: Session = Depends(get_db)
):
    return crud.get_cars(db, make, bodytype, state, model, fuel,min_price, max_price, min_power, max_power, min_grade, max_grade,
                         gearbox, color, upholstery, traction, skip, limit)
    
    
@router.get("/cars/compare")
def get_cars_compare(car1: int, car2: int, db: Session = Depends(get_db)):
    db_car1 = crud.get_car(db, car_id=car1)
    if db_car1 is None:
        raise HTTPException(status_code=404, detail="Car not found")
    
    db_car2 = crud.get_car(db, car_id=car2)
    if db_car1 is None:
        raise HTTPException(status_code=404, detail="Car not found")
    
    car_dict1 = db_car1.__dict__
    car_dict2 = db_car2.__dict__
    
    result = api_calls.generate_compare(car_dict1, car_dict2)
    response = {
        "car1": db_car1,
        "car2": db_car2,
        "result_id": result
    }
    
    return response
    
    
    
@router.get("/cars/summary")
def read_cars_summary(db: Session = Depends(get_db)):
    return crud.get_cars_summary(db)