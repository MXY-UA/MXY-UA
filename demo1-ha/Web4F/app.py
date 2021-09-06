from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "<p>Hello World from Flask. You are at Web2:8080</p>\n"
