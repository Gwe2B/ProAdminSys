from bottle import *
from os import listdir
from os.path import isfile, join
import hashlib
import json

IMG_FOLDER:str = './static/img'

app = Bottle()
auth_file_content = ''

def is_authenticated_user(username:str, password:str)->bool:
    global auth_file_content
    result:bool = False
    print(auth_file_content)

    if username in auth_file_content[0]:
        hashed_password = hashlib.sha256(password.encode('utf8')).digest().hex()
        if auth_file_content[0][username] == hashed_password:
            result = True
    
    return result

@app.route('/static/<filename:path>')
def serv_static(filename:str):
    return static_file(filename,root='static')

if isfile('./auth.json'):
    with open('./auth.json') as file:
        lines = file.readlines()
        for line in lines:
            auth_file_content = auth_file_content+line
        auth_file_content = auth_file_content.replace('\n', '')
        auth_file_content = auth_file_content.replace('\r', '')
        auth_file_content = auth_file_content.replace('\t', '')

        file.close()
    
    auth_file_content = json.loads(auth_file_content)

    @app.route('/')
    @auth_basic(is_authenticated_user)
    def index():
        lst_img = [join(IMG_FOLDER,f) for f in listdir(IMG_FOLDER) if isfile(join(IMG_FOLDER,f))]
        my_dict = dict([('images', lst_img)])
        print(lst_img)
        return template('views/index.tlp', my_dict)
else:
    @app.route('/')
    def index():
        lst_img:list = [join(IMG_FOLDER,f) for f in listdir(IMG_FOLDER) if isfile(join(IMG_FOLDER,f))]
        my_dict:dict = dict([('images', lst_img)])
        print(lst_img)
        return template('views/index.tlp', my_dict)

run(app, host='localhost', debug=True, reloader=True, port=8080)