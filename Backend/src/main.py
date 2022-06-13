from fastapi import FastAPI
from db import models
from db.database_connection import engine
from routes.user_routes import user_router
from routes.report_routes import report_router
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins='*',
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

models.User.metadata.create_all(engine)

app.include_router(user_router)
app.include_router(report_router)