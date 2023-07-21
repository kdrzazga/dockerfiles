import sys
import json
import logging
from flask import Flask, request, jsonify

from game import Game
from drawer import draw
from gamemap import gamemap

app = Flask(__name__)
game = Game()

@app.route('/', methods=['GET'])
def get_info_endpoint():
    logging.info('INFO')
    return 'pyvilization - a Civilization-like game in python'


@app.route('/start-game', methods=['POST'])
def start_game_endpoint():
    map = gamemap.generate_map()
    
    status = 200 if map is not None else 500
    message = 'Done' if map is not None else 'Map generation failed'
    
    response = {'message': message}
    logging.info(message)
    
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
    message_result =  'Done' if success else 'Invalid move attempt'
    message = json.dumps(new_position)
    
    response = {'result' : message_result, 'position' : message}
    return jsonify(response), status


@app.route('/found', methods=['POST'])
def found_city_endpoint():
    old_cities_count = len(game.cities)
    data = request.get_json()
    
    city_name = data.get('city-name')
    
    game.found_city(city_name)
    
    logging.info("Foundation of city: {city_name}")
    
    status = 200 if len(game.cities) == old_cities_count + 1 else 500
    success = '' if status == 200 else 'not ' 
    
    response = {'city' : 'City ' + city_name + ' ' + success + 'founded.'}
    return jsonify(response), status


@app.route('/exit', methods=['POST'])
@app.route('/quit', methods=['POST'])
def exit_endpoint():
    sys.exit(0)


@app.route('/city/<int:id>', methods=['GET'])
def city_endpoint(id):
    response = {'city ' + str(id) : game.get_cities()[id].to_string()}
    return jsonify(response), 200
    
    
@app.route('/cities', methods=['GET'])
def cities_endpoint():
    cities = game.get_cities()

    response = {'List of cities:' : ' '.join(city.name for city in cities)}
    return jsonify(response), 200    

    
@app.route('/cities/<string:player_name>', methods=['GET'])
def player_cities_endpoint(player_name):
    cities = game.get_player_cities(player_name)

    response = {'List of cities:' : ' '.join(city.name for city in cities)}
    return jsonify(response), 200


@app.route('/help', methods=['GET'])
def help_endpoint():
    response = {'message' : game.help()}
    return jsonify(response), 200


@app.route('/map', methods=['GET'])
def map_endpoint():
    map = gamemap.get_map()
    status = 200 if map is not None else 500
    message = json.dumps(map) if map is not None else 'Map generation failed'
    
    response = {'map' : message}
    return jsonify(response), status


if __name__ == '__main__':
    service_port = 9982
    print(f"Starting service on {service_port}")
    app.run(port=service_port)
