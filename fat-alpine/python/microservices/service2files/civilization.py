from flask import Flask, jsonify
from game import move, help, found_city
from drawer import draw
import sys
import json

from gamemap import generate_map, get_map

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
    new_position = None
    status = 200 if new_position is not None else 500
    message = json.dumps(new_position) if map is not None else 'No move'
    
    response = {'move' : message}
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
