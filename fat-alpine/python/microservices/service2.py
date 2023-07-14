from flask import Flask, jsonify
from service2files.game import move, help, found_city
from service2files.drawer import draw
from service2files.gamemap import generate_map, get_map

app = Flask(__name__)


@app.route('/', methods=['GET'])
def get_info_endpoint():
    return 'pyvilization - a Civilization-like game in python'


@app.route('/start-game', methods=['POST'])
def start_game_endpoint():
    map = generate_map()
    
    status = 200 if map is not None else 500
    message = 'Done' if map is not None else 'Map generation failed'
    
    response = {'message': message}
    return jsonify(response), status


@app.route('/move', methods=['POST'])
def move_endpoint():
    #move()
    pass


@app.route('/found', methods=['POST'])
def start_game():
    #found_city()
    pass


@app.route('/help', methods=['GET'])
def help_endpoint():
    response = {'message' : help()}
    return jsonify(response), 200


@app.route('/map', methods=['GET'])
def map_endpoint():
    map = JSON.stringify(get_map())


if __name__ == '__main__':
    print("starting service on 9982")
    app.run(port=9982)
