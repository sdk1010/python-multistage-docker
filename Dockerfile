# docker stage 1

FROM python:3.9 AS backend-builder

WORKDIR /app

COPY ./backend /app

RUN pip install --no-cache-dir -r requirements.txt

# docker stage 2

FROM python:3.9-slim-buster

WORKDIR /app

COPY --from=backend-builder /app /app

RUN pip install flask

EXPOSE 5000

CMD ["python","app.py"]
