FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY *.py /app/
COPY *.css /app/
COPY requirements.txt /app/
RUN pip3 install -r requirements.txt

EXPOSE 8501

ENTRYPOINT ["streamlit", "run", "lake_viewer.py", "--server.port=8501", "--server.address=0.0.0.0"]
