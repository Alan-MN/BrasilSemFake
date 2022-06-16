from sqlalchemy import Column, Integer, String, DateTime
from .database_connection import Base

class User(Base):
  __tablename__ = 'users'
  id = Column(Integer, primary_key=True)
  username = Column(String, unique=True)
  email = Column(String, unique=True)
  password = Column(String)
  state = Column(String)
  reliability = Column(Integer)
  token = Column(String)

  created_at = Column(DateTime)
  updated_at = Column(DateTime)

class Report(Base):
  __tablename__ = 'reports'
  id = Column(Integer, primary_key=True)
  user_id = Column(Integer)
  title = Column(String)
  content = Column(String)
  status = Column(String, nullable=True)

  created_at = Column(DateTime)
  updated_at = Column(DateTime)