from pydantic import BaseModel

class UserSchema(BaseModel):
  username: str
  email: str
  password: str
  birthday: str

class UserLoginSchema(BaseModel):
  username: str
  password: str