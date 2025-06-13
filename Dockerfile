FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy requirements file
COPY src/requirements.txt requirements.txt

# Install dependencies without cache
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY src/ .

# The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
# This is mainly for documentation purposes.
EXPOSE 8080

# The command to run the application with Gunicorn (a production-grade WSGI server) instead of Flask's built-in server.
# --bind 0.0.0.0:8080: Listen on all network interfaces on port 8080.
# --workers 1: Using a single worker for a clean and predictable CPU load. It could be increased if necessary.
# app:app: Tells Gunicorn to look for the Flask instance named 'app' inside the file 'app.py'.
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "--workers", "1", "app:app"]
