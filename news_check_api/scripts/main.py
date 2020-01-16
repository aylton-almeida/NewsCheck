from flask import Flask, request

from scripts.utils.FileLoader import load_files
from scripts.utils.TextVerifier import TextVerifier
from scripts.utils.URLReader import URLReader

app = Flask(__name__)

files = load_files()

textVerifier = TextVerifier(files[0], files[1])


@app.route('/checkUrl', methods={"POST"})
def verify_url():
    url = request.data.decode('utf-8')
    url_reader = URLReader(url)
    answer = url_reader.get_text()
    print(answer)
    if answer[1]:
        return {
            'id': '1',
            'content': answer[0]
        }
    else:
        return {
            'id': '0',
            'content': textVerifier.check_validity(answer[0])
        }


@app.route('/checkText', methods={"POST"})
def verify_text():
    return {
        'id': '0',
        'content': textVerifier.check_validity(request.data.decode('utf-8'))
    }


app.run(debug=True, host='0.0.0.0')
