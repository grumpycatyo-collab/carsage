import json
import logging as log
from sqlalchemy.orm import Session
from fastapi import APIRouter, HTTPException, Body, status, Depends, Query
from ..crud import crud, schemas
from business.models import models
from foundation.database import SessionLocal, engine
from typing import List

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
    db_user = crud.get_car(db, car_id=car_id)
    if db_user is None:
        raise HTTPException(status_code=404, detail="User not found")
    return db_user