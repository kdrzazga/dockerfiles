import json
import logging

from flask import Flask, request, jsonify

from technology_tree import TechnologyTree

app = Flask(__name__)

file_path = 'tech-tree.yml'
tech_tree = TechnologyTree(file_path, 'start')

developed_technologies = {}
previous_step_tech = ''

#curl http://127.0.0.1:9983/
@app.route('/', methods=['GET'])
def get_info():
    info = 'Technology Tree service'
    
    logging.info(info)
    return info, 200


#curl --header "Content-Type: application/json" --request POST --data {\"technology\" : \"chilvary\"}  http://127.0.0.1:9983/start-technology-develop
@app.route('/start-technology-develop', methods=['POST'])
def start_tech_develop_srv():
    data = request.get_json()
    new_technology = data.get('technology')

    tech_tree.start_tech_develop(new_technology)
    message_text = 'tech develop started'
    message = jsonify({'message' : message_text})
    
    logging.info(message_text)
    return message, 200


#curl --header "Content-Type: application/json" --request PUT http://127.0.0.1:9983/tech-develop-step
@app.route('/tech-develop-step', methods=['PUT'])
def proceed_tech_develop():
    status = tech_tree.proceed_tech_develop()
    message_text = 'tech development locked' if status == 'done' else 'tech develop moved by 1 step'
    status = 423 if status == 'done' else 200
    message = jsonify({'message' : message_text})
    
    logging.info(message_text)    
    return message, status


#curl http://127.0.0.1:9983/current-tech
@app.route('/current-tech', methods=['GET'])
def get_current_tech():
    tech = tech_tree.get_current_tech()
    message = jsonify({'currently developed technology' : tech})
    
    return message, 200


#curl http://127.0.0.1:9983/full-progress-path
@app.route('/full-progress-path', methods=['GET'])
def get_progress_path_full():
    
    path = []
    
    logging.info("Progress path:")
    
    for i, tech in tech_tree.get_progress_path():
        path.append({i : tech})
        logging.info(str(i) + ": " + tech)
    
    response = json.dumps(path)
    return jsonify(response), 200
    

if __name__ == '__main__':
    file_path = 'tech-tree.yml'
    starting_technology = 'start'
    tech_tree = TechnologyTree(file_path, starting_technology)

    print("starting service on 9983")
    app.run(port=9983)
