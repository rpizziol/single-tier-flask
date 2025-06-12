# single-tier-flask
A simple single-tier Python application built with Flask.

## Setup Instructions

1. Create a Python virtual environment:
   ```bash
   python3 -m venv venv
   ```

2. Activate the virtual environment:
   ```bash
   source venv/bin/activate
   ```

3. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Running the Application

1. (Optional) Set the environment variable `BUSY_WAIT_MEAN`:
   ```bash
   export BUSY_WAIT_MEAN=<desired_value_in_seconds>
   ```
   Replace `<desired_value_in_seconds>` with the mean value for busy waiting (e.g., `1.0`). If not set, the application defaults to `1.0`.

2. Start the application locally:
   ```bash
   python app.py
   ```

3. Access the application at:
   ```
   http://127.0.0.1:8080
   ```


