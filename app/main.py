import torch
import io
from fastapi import FastAPI

from pydantic import BaseModel

class Result(BaseModel):
    category: str
    confidence: float