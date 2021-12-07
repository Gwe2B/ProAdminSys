from bottle import *
from os import listdir
from os.path import isfile, join 

IMG_FOLDER = './static/img'

app = Bottle()

@app.route('/static/<filename:path>')
def serv_static(filename):
    return static_file(filename,root='static')

@app.route('/')
def index():
    lst_img = [join(IMG_FOLDER,f) for f in listdir(IMG_FOLDER) if isfile(join(IMG_FOLDER,f))]
    my_dict = dict([('images', lst_img)])
    print(lst_img)
    return template('views/index.tlp', my_dict)


run(app, host='localhost', debug=True, reloader=True, port=8080)