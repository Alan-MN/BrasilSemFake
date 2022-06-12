from sqlalchemy import Column, Integer, String
from .database_connection import Base

class User(Base):
  __tablename__ = 'users'
  id = Column(Integer, primary_key=True)
  username = Column(String, unique=True)
  email = Column(String, unique=True)
  password = Column(String)
  reliability = Column(Integer)
  token = Column(String)
  recovery_code = Column(String)