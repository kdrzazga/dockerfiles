from flask import Flask

from service1files.logic import generate_entries


app = Flask(__name__)

@app.route('/', methods=['GET'])
def get_info():
    return 'service1'

# curl -X POST http://localhost:9981/generate/3        
@app.route('/generate/<int:count>', methods=['POST'])
def generate_entries_srv(count):
    if generate_entries(count):
        return 'Done', 200
    else:
        return 'Error', 500


if __name__ == '__main__':
    print("starting service on 9981")
    app.run(port=9981)
