from flask import Flask
from service2files.map import generate_map, get_map
from service2files.drawer import draw

app = Flask(__name__)


@app.route('/', methods=['GET'])
def get_info():
    return 'pyvilization - a Civlization-like game in python'


@app.route('/start-game', methods=['POST'])
def start_game():
    generate_map()


@app.route('/draw-map', methods=['GET'])
def start_game():
    draw(get_map)


if __name__ == '__main__':
    print("starting service on 9982")
    app.run(port=9982)
