from email.charset import BASE64
from pydantic import BaseModel

class forgotSchema(BaseModel):
    username: str

class recoverySchema(BaseModel):
    username: str
    recovery_code: str

class checkSchema(BaseModel):
    username: str