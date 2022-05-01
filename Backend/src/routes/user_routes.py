from services.user import create_user_service, login_service
from db.schemas.user_schema import UserSchema, UserLoginSchema
from fastapi import APIRouter, Depends
from db.database_connection import get_db
from sqlalchemy.orm import Session


router = APIRouter()

@router.post("/user/create")
async def create_user(request: UserSchema, db: Session = Depends(get_db)):
  return await create_user_service(request, db)

@router.post('/user/login')
async def login(request: UserLoginSchema, db: Session = Depends(get_db)):
  return await login_service(request, db)