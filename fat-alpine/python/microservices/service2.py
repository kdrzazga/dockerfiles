from flask import Flask

app = Flask(__name__)

@app.route('/', methods=['GET'])
def get_info():
    return 'service2'

if __name__ == '__main__':
    print("starting service on 9982")
    app.run(port=9982)
