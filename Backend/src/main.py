from fastapi import FastAPI
from db import models
from db.database_connection import engine
from routes.user_routes import router
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

app.include_router(router)