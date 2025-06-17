# Stage 1: Use an official Python runtime as a parent image.
FROM python:3.9-slim

WORKDIR /app

# Copy the requirements file from the 'src' subdirectory first.
COPY src/requirements.txt requirements.txt

# Install the Python dependencies.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code from the 'src' subdirectory.
COPY src/ .

# --- NEW STEPS FOR ENTRYPOINT SCRIPT ---
# Copy the entrypoint script into the container.
COPY entrypoint.sh .

# Make the entrypoint script executable.
RUN chmod +x ./entrypoint.sh
# --- END NEW STEPS ---

EXPOSE 8080

# Set the entrypoint to our new script.
# This will be executed when the container starts.
ENTRYPOINT ["./entrypoint.sh"]
