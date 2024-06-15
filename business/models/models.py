from foundation.database import Base
import datetime
from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from pydantic import BaseModel, Field
from typing import Optional, List

Base = declarative_base()

class Car(Base):
    __tablename__ = "cars"
    id = Column(Integer, primary_key=True)
    make = Column(String)
    bodytype = Column(String)
    state = Column(String)
    model = Column(String)
    fuel = Column(String)
    price = Column()
    power = Column(Integer)
    torque = Column(Integer)
    gearbox = Column(String)  # automate, manual
    color = Column(String)
    upholstery = Column(String)
    traction = Column(String)  # rwd, fwd, awd
    grade = Column(Integer)  # from 0 to 10

    def __repr__(self):
        return (f"<Car(brand='{self.brand}', model='{self.model}', fuel='{self.fuel}', price={self.price}, "
                f"power={self.power}, torque={self.newton_meters}, gearbox='{self.gearbox}', color='{self.color}', "
                f"upholstery='{self.upholstery}', traction='{self.traction}', grade={self.grade})>")

class CarFilter(BaseModel):
    make__in: Optional[List[str]] = Field(None, alias="make")
    bodytype__in: Optional[List[str]] = Field(None, alias="bodytype")
    state__in: Optional[List[str]] = Field(None, alias="state")
    model__in: Optional[List[str]] = Field(None, alias="model")
    fuel__in: Optional[List[str]] = Field(None, alias="fuel")
    price__lt: Optional[float] = Field(None, alias="price")
    power__in: Optional[List[int]] = Field(None, alias="power")
    torque__in: Optional[List[int]] = Field(None, alias="torque")
    gearbox__in: Optional[List[str]] = Field(None, alias="gearbox")
    color__in: Optional[List[str]] = Field(None, alias="color")
    upholstery__in: Optional[List[str]] = Field(None, alias="upholstery")
    traction__in: Optional[List[str]] = Field(None, alias="traction")
    grade__gte: Optional[int] = Field(None, alias="grade") 

    class Constants:
        model = Car

    class Config:
        allow_population_by_field_name = True