from fastapi import APIRouter,Depends
from db.schemas.recovery_schema import passwordChangeSchema
from services.recovery import passwordChange
from db.schemas.recovery_schema import recoverySchema
from services.recovery import validateRecoveryCode
from services.recovery import checkData
from db.schemas.recovery_schema import checkSchema
from db.schemas.recovery_schema import forgotSchema
from sqlalchemy.orm import Session
from db.database_connection import get_db
from services.recovery import forgot_password

recovery_router = APIRouter()

@recovery_router.post('/recovery/forgot')
async def forgot(request: forgotSchema,db: Session = Depends(get_db)):
  return  await forgot_password(request,db)

@recovery_router.get('/recovery/checkdata')
async def check(request: checkSchema,db: Session = Depends(get_db)):
    return await checkData(request,db)

@recovery_router.post('/recovery/validate')
async def validate(request: recoverySchema, db: Session = Depends(get_db)):
    return await validateRecoveryCode(request,db)

@recovery_router.post('/recovery/passwordchange')
async def change(request: passwordChangeSchema,db:Session = Depends(get_db)):
  return await passwordChange(request,db)