from flask import Flask


app = Flask(__name__)

@app.route("/")
def hello_world():
    """This function runs when someone visits the homepage."""
    return "Hello, World!"


# host='0.0.0.0' makes the server publicly available, which is needed for Docker.
# port=8080 is a common port for web applications in containers.
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)