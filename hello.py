from flask import Flask
from flask import request

app = Flask(__name__)


@app.route('/')
def index():
    return '<h1>Bad Request</h1>', 400


@app.route('/user/<name>')
def user(name):
    return '<h1>Hello, {}!</h1>'.format(name)
