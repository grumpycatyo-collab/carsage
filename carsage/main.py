"""
Main Module for FastAPI Application

This module serves as the entry point for the FastAPI application. It initializes
the FastAPI instance, includes routers, and configures the application.
"""
import os

import uvicorn
from fastapi import FastAPI

# from api.v1 import lesson_plan_endpoint
# from dependencies.auth import authenticate

app = FastAPI()

app.include_router(
    lesson_plan_endpoint.router,
    prefix="/v1",
    tags=["v1"]
)

if __name__ == "__main__":
    host = "localhost"
    port = 8000
    uvicorn.run(app, host=host, port=port)
