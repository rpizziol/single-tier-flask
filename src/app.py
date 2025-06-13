from flask import Flask
import time
import numpy as np
import os

# Create an instance of the Flask class
app = Flask(__name__)

@app.route("/")
def busy_wait_task():
    """
    This endpoint simulates a CPU-intensive task with a "busy wait".
    The duration of the task follows an exponential distribution
    with a mean of 1.0 second.
    """
    # Read the mean duration from an environment variable, defaulting to 1.0 second.
    # The value is read as a string and must be converted to a float.
    try:
        mean_duration = float(os.environ.get('BUSY_WAIT_MEAN', '1.0'))
    except ValueError:
        # Fallback to default if the environment variable is not a valid number
        mean_duration = 1.0

    # Generate a random duration from an exponential distribution with the configurable mean
    duration_seconds = np.random.exponential(mean_duration)
    
    # Get the start time for the busy wait loop
    start_time = time.time()
    end_time = start_time + duration_seconds
    
    # This loop will run continuously, consuming CPU until the duration has passed.
    while time.time() < end_time:
        # The 'while' condition check keeps the CPU core busy.
        pass
        
    # Return a success message indicating the duration of the completed task
    return f"CPU busy wait completed for {duration_seconds:.4f} seconds (mean: {mean_duration}s)."


# host='0.0.0.0' makes the server publicly available, which is needed for Docker.
# port=8080 is a common port for web applications in containers.
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)