from bottle import *

app = Bottle()

@app.route('/static/<filename:path>')
def serv_static(filename):
    return static_file(filename,root='static')

@app.route('/')
def index():
    return template('views/index.tlp')

run(app, host='localhost', debug=True, reloader=True, port=8080)