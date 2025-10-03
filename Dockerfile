# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies 
RUN apt-get update && apt-get install -y \
    python3-dev \
    build-essential \
    ffmpeg \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements if you have one
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Expose port (if running Flask for health check)
EXPOSE 8080

# Run your bot
CMD ["python3", "main.py"]
