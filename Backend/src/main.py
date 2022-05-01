from fastapi import FastAPI
from db import models
from db.database_connection import engine
from routes.user_routes import router

app = FastAPI()

models.User.metadata.create_all(engine)

app.include_router(router)