from db.schemas.report_schema import CreateReportSchema
from sqlalchemy.orm import Session
from fastapi import HTTPException, Request
from fastapi.encoders import jsonable_encoder
from db.models import Report, User
import datetime

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
  return new_report

async def list_reports_service(request: Request, db: Session):
  return db.query(Report).all()

async def get_report_service(request: Request, report_id: str, db: Session):
  report = db.query(Report).filter(Report.id == report_id).first()
  if not report:
    raise HTTPException(status_code=400, detail="Report not found")

  return report

async def update_status_report_service(request: Request, db: Session):
  report = db.query(Report).filter(Report.id == request.report_id).first()
  report_encoded = jsonable_encoder(report)

  if report_encoded:
    report.status = request.status
    db.commit()
    return { "status": report.status }
  else: 
    raise HTTPException(status_code=400, error="Report does not exists")
