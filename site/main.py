from bottle import *

app = Bottle()

@app.route('/')
def index():
    return template('views/index.tlp')

run(app, host='localhost', debug=True, reloader=True, port=8080)