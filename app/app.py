from flask import Flask
import os

app = Flask(__name__)

@app.route("/hostname", methods=['GET'])
def get_hostname():
    return os.uname()[1]  + '\n'

@app.route("/author", methods=['GET'])
def get_author():
    return os.getenv('AUTHOR') + '\n'

@app.route("/id", methods=['GET'])
def get_id():
    return os.getenv('UUID')  + '\n'

@app.route("/hc", methods=['GET'])
def hc():
    return 'STATUS:OK'