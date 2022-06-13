from db.schemas.user_schema import UserSchema
from fastapi.encoders import jsonable_encoder
from bcrypt import hashpw, gensalt, checkpw
from sqlalchemy.orm import Session
from fastapi import HTTPException, Request
from dotenv import load_dotenv
from db.models import User
from jwt import encode
from os import getenv
import datetime

load_dotenv()

async def create_user_service(request: UserSchema, db: Session):
  digest_password = hashpw(request.password.encode('utf8'), gensalt())

  new_user = User(
    username=request.username,
    email=request.email,
    password=digest_password.decode('utf8'),
    state=request.state,
    reliability=0,
    created_at=datetime.datetime.now()
  )
  db.add(new_user)
  db.commit()
  db.refresh(new_user)
  return new_user

async def login_service(request: UserSchema, db: Session):
  user = db.query(User).filter(User.username == request.username).first()
  user_encoded = jsonable_encoder(user)

  if user_encoded:
    if checkpw(request.password.encode(), user_encoded["password"].encode()):
      token = encode({"exp": datetime.datetime.now() + datetime.timedelta(days=7), "id": user_encoded["id"], "username": user_encoded["username"]}, getenv("SECRET_JWT_KEY"), algorithm="HS256")
      user.token = token
      db.commit()
      return { "token": token }
    else: 
      raise HTTPException(status_code=400, error="Wrong password")
  else:
    raise HTTPException(status_code=400, error="User does not exist")

async def list_users_service(request: Request, db: Session):
  return db.query(User).all()

async def get_user_service(request: Request, user_id: str, db: Session):
  user = db.query(User).filter(User.id == user_id).first()
  if not user:
    raise HTTPException(status_code=400, detail="User not found")

  return user