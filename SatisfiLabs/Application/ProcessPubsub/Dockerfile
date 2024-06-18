# Use the official Python base image (choose a specific version like 3.9 or 3.10)
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies (if needed)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        gcc \ 
        libc-dev \ 
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code
COPY . .

# Set an environment variable to disable buffering (optional)
ENV PYTHONUNBUFFERED=1

# Specify the command to run your application (replace app.py with your main script)
CMD ["python", "processPubsub.py"]
