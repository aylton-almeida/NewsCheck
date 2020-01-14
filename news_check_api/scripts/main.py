import pickle

import joblib
from flask import Flask, escape, request

from scripts.utils.FileReader import file_reader
from scripts.utils.ProcessText import ProcessText

app = Flask(__name__)

files = file_reader()

ProcessText = ProcessText(files[0], files[1])


@app.route('/', methods={"POST"})
def deafult():
    return ProcessText.check_validity(request.data.decode('utf-8'))


app.run(debug=True, host='0.0.0.0')
