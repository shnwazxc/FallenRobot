FROM python:3.11-slim

WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install system dependencies and Python packages
RUN apt-get update -y && apt-get upgrade -y && \
    pip3 install -U pip setuptools && \
    pip3 install -U -r requirements.txt

# Copy application code
COPY . .

# Run the bot
CMD ["python3", "-m", "FallenRobot"]
