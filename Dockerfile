FROM python:3.12-slim

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install -r /code/requirements.txt

COPY ./app /code/app

# Setting it empty allows flexibility in case a better model becomes available
ENV WANDB_API_KEY=""
ENV MODEL_PATH=""
ENV PORT=8080

EXPOSE $PORT

# equivalent of terminal's fastapi run app/main.py --port 8080
CMD ["sh", "-c", "uvicorn app.main:app --host 0.0.0.0 --port $PORT"]
