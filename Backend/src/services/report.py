from turtle import update

from sqlalchemy import false
from db.schemas.report_schema import CreateReportSchema
from sqlalchemy.orm import Session
from fastapi import HTTPException, Request
from fastapi.encoders import jsonable_encoder
from db.models import Report, User
import datetime
import requests
import json

async def create_report_service(request: Request , createReportDTO: CreateReportSchema, db: Session):
  token = request.headers.get('token')
  if not token:
    raise HTTPException(status_code=400, detail="Token is missing")

  user = db.query(User).filter(User.token == token).first()
  if not user:
    raise HTTPException(status_code=400, detail="User not found")

  new_report = Report(
    title = createReportDTO.title,
    content = createReportDTO.content,
    user_id = user.id,
    created_at = datetime.datetime.now()
  )
  db.add(new_report)
  db.commit()
  db.refresh(new_report)
  id = new_report.id
  news_status = testaNews(new_report.content)
  await update_status_report_service(id,db,status=news_status)
  return new_report

async def list_reports_service(request: Request, db: Session):
  return db.query(Report).all()

async def get_report_service(request: Request, report_id: str, db: Session):
  report = db.query(Report).filter(Report.id == report_id).first()
  if not report:
    raise HTTPException(status_code=400, detail="Report not found")

  return report

async def update_status_report_service(id, db: Session,status):
  report = db.query(Report).filter(Report.id == id).first()
  report_encoded = jsonable_encoder(report)
  if report_encoded:
    report.status = status
    db.commit()
    return { "status": report.status }
  else: 
    raise HTTPException(status_code=400, error="Report does not exists")


def testaNews(texto):
  data = {"newsText": texto}
  response = requests.post('https://bsf-chatbot.herokuapp.com/classifier/svm/predit', json=data)
  response_dict = json.loads(response.text)
  if response_dict['newsType'] == False:
    newsType = "FAKE"
  else:
    newsType = "FATO"
  return newsType
