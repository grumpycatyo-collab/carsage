import datetime
from foundation.database import Base
from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, DateTime
from sqlalchemy.orm import relationship
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

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
    
    class Config:
        orm_mode = True
        from_attributes = True