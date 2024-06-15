from pydantic import BaseModel
from typing import List
from datetime import datetime

class CarBase(BaseModel):
    make: str
    model: str
    fuel: str
    price: float
    power: int
    torque: int
    gearbox: str  # automate, manual
    color: str
    upholstery: str
    traction: str  # rwd, fwd, awd
    grade: int  # from 0 to 10

class CarCreate(CarBase):
    pass

class Car(CarBase):
    id: int

    class Config:
        orm_mode = True