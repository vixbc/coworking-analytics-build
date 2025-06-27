# Use a lightweight Python image
FROM python:3.8-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Install dependencies
COPY analytics/requirements.txt /app/
RUN pip install --no-cache-dir -r analytics/requirements.txt

# Copy application code
COPY . /app/

# Expose the app port
EXPOSE 5153

# Set default command
CMD ["python", "analytics/app.py"]
