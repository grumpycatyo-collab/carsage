import json
import logging as log
from sqlalchemy.orm import Session
from fastapi import APIRouter, HTTPException, Body, status, Depends, Query
from ..crud import crud, schemas
from business.models import models
from foundation.database import SessionLocal, engine
from typing import List
from typing import Optional
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


@router.get("/car/{car_id}", response_model=schemas.Car)
def read_car(car_id: int, db: Session = Depends(get_db)):
    db_car = crud.get_car(db, car_id=car_id)
    if db_car is None:
        raise HTTPException(status_code=404, detail="Car not found")
    return db_car

@router.get("/cars/", response_model=List[schemas.Car])
def get_cars(
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
                         gearbox, color, upholstery, traction,
                         )