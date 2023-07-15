from flask import Flask, request, jsonify
from game import Game
from drawer import draw
import sys
import json
import logging

from gamemap import generate_map, get_map

app = Flask(__name__)
game = Game()

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
    data = request.get_json()
    newX = data.get('newX')
    newY = data.get('newY')
    
    logging.info("[{newX}, {newY}]")
    success = game.move(newX, newY)
    
    new_position = [game.player.x, game.player.y]
    status = 200 if success else 500
    message_result =  'done' if success else 'move invalid'
    message = json.dumps(new_position)
    
    response = {'result' : message_result, 'position' : message}
    return jsonify(response), status


@app.route('/found', methods=['POST'])
def found_city_endpoint():
    city = None
    status = 200 if city is not None else 500
    message = json.dumps(city) if map is not None else 'City not founded'
    
    response = {'city' : message}
    return jsonify(response), status


@app.route('/exit', methods=['POST'])
@app.route('/quit', methods=['POST'])
def exit_endpoint():
    sys.exit(0)


@app.route('/help', methods=['GET'])
def help_endpoint():
    response = {'message' : help()}
    return jsonify(response), 200


@app.route('/map', methods=['GET'])
def map_endpoint():
    map = get_map()
    status = 200 if map is not None else 500
    message = json.dumps(map) if map is not None else 'Map generation failed'
    
    response = {'map' : message}
    return jsonify(response), status


if __name__ == '__main__':
    service_port = 9982
    print(f"Starting service on {service_port}")
    app.run(port=service_port)
