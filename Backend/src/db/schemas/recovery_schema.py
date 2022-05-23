from pydantic import BaseModel

class forgotSchema(BaseModel):
    username: str

class passwordChangeSchema(BaseModel):
    username: str
    newPassword: str
class recoverySchema(BaseModel):
    username: str
    recovery_code: str

class checkSchema(BaseModel):
    username: str