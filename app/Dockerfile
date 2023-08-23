FROM python:3.8-alpine

ENV AUTHOR=Maksim UUID=16422a7e-40ce-11ee-b094-5bf21e546ee6
WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000
COPY app.py ./

ENTRYPOINT [ "gunicorn", "-w 3", "-b 0.0.0.0", "app:app" ]