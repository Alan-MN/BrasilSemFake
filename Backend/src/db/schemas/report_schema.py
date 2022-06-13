from pydantic import BaseModel

class CreateReportSchema(BaseModel):
  title: str
  content: str