from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "<p>Hello World from Flask. You are at Web1:8080</p>"
