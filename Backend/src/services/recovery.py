import random
import string
from bcrypt import checkpw, gensalt, hashpw
from fastapi.encoders import jsonable_encoder
from db.schemas.recovery_schema import recoverySchema
from db.schemas.recovery_schema import checkSchema
from services.mailer import mandaEmail
from db.database_connection import get_db
from db.schemas.recovery_schema import forgotSchema
from sqlalchemy.orm import Session
from fastapi import Depends
from db.models import User

async def forgot_password(request:forgotSchema, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == request.username).first()
    try:
        user_encoded = jsonable_encoder(user)
        random_code = generateRecoveryCode()
        new_recovery_code = hashpw(random_code.encode(),gensalt())
        user.recovery_code = new_recovery_code.decode('utf8')
        db.commit()

        corpo = f'the new password for the user "{request.username}" is: '
        mandaEmail(user_encoded['email'],'Password recovery',corpo)
        return f'The new password for {request.username} was sent to your registered e-mail account{random_code}'
    except:
        return f'The user {request.username} was not found'

async def checkData(request:checkSchema, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == request.username).first()
    user_encoded = jsonable_encoder(user)
    return user_encoded

async def validateRecoveryCode(request: recoverySchema, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == request.username).first()
    user_encoded = jsonable_encoder(user)
    if user_encoded:
        if checkpw(request.recovery_code.encode(), user_encoded["recovery_code"].encode()):
            return { "Code_valid": 'True'}
        else: 
            return "Wrong recovery code"
    else:
        return "User not found"


def generateRecoveryCode():
    new_code = ''
    minusculas = string.ascii_lowercase
    maiusculas = string.ascii_uppercase
    numeros = ['0','1','2','3','4','5','6','7','8','9']
    caracteres = string.punctuation
    for i in range(7):
        new_code = new_code + minusculas[random.randrange(len(minusculas))]
    new_code = new_code + maiusculas[random.randrange(len(maiusculas))]
    new_code = new_code + caracteres[random.randrange(len(caracteres))]
    new_code = new_code + numeros[random.randrange(len(numeros))]
    return new_code