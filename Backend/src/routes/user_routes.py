from services.user import create_user_service, login_service, get_user_service, list_users_service
from db.schemas.user_schema import UserSchema, UserLoginSchema
from fastapi import APIRouter, Depends, Request
from db.database_connection import get_db
from sqlalchemy.orm import Session

user_router = APIRouter()

@user_router.get('/user/{user_id}')
async def get_report(request: Request , user_id: str, db: Session = Depends(get_db)):
  return await get_user_service(request, user_id, db)

@user_router.get('/users')
async def list_reports(request: Request , db: Session = Depends(get_db)):
  return await list_users_service(request, db)

@user_router.post("/user/create")
async def create_user(request: UserSchema, db: Session = Depends(get_db)):
  return await create_user_service(request, db)

@user_router.post('/user/login')
async def login(request: UserLoginSchema, db: Session = Depends(get_db)):
  return await login_service(request, db)