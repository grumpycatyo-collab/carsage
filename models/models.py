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