from services.report import create_report_service, list_reports_service, get_report_service, update_status_report_service
from db.schemas.report_schema import CreateReportSchema
from fastapi import APIRouter, Depends, Request
from db.database_connection import get_db
from sqlalchemy.orm import Session

from db.schemas.recovery_schema import updateSchema

report_router = APIRouter()

@report_router.get('/report/{report_id}')
async def get_report(request: Request , report_id: str, db: Session = Depends(get_db)):
  return await get_report_service(request, report_id, db)

@report_router.get('/reports')
async def list_reports(request: Request , db: Session = Depends(get_db)):
  return await list_reports_service(request, db)

@report_router.post('/report/create')
async def create_report(request: Request , createReportDTO: CreateReportSchema, db: Session = Depends(get_db)):
  return await create_report_service(request, createReportDTO, db)

@report_router.post('/report/update')
async def create_report(request: updateSchema , db: Session = Depends(get_db)):
  return await update_status_report_service(request, db)
