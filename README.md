# single-tier-flask
A simple single-tier Python application built with Flask.

## Local Run

### Setup Instructions

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

### Running the Application Locally

1. (Optional) Set the environment variable `BUSY_WAIT_MEAN`:
   ```bash
   export BUSY_WAIT_MEAN=<desired_value_in_seconds>
   ```
   Replace `<desired_value_in_seconds>` with the mean value for busy waiting (e.g., `1.0`). If not set, the application defaults to `1.0`.

2. Start the application:
   ```bash
   python app.py
   ```

3. Access the application at:
   ```
   http://127.0.0.1:8080
   ```

## Deployment on Kubernetes

This application is available on Docker Hub. Pull the Docker image using the following command:

```bash
docker pull rpizziol/single-tier-app
```

For more details, visit the Docker Hub page: [rpizziol/single-tier-app](https://hub.docker.com/r/rpizziol/single-tier-app)

### Running the Application in a Kubernetes Cluster

1. Ensure your Kubernetes cluster is properly configured and running.

2. (Optional) Modify the environment variables in the `k8s/deployment.yaml` file:
   - `GUNICORN_WORKERS`: Adjust the number of Gunicorn workers as needed.
   - `BUSY_WAIT_MEAN`: Set the desired mean value for busy waiting (default is `1.0`).

3. Deploy the application to the cluster:
   ```bash
   kubectl apply -f k8s/deployment.yaml
   ```

## Author

* [Roberto Pizziol](https://github.com/rpizziol)


