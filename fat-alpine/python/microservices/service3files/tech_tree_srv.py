import logging

from flask import Flask, request, jsonify

from technology_tree import TechnologyTree

app = Flask(__name__)

@app.route('/', methods=['GET'])
def get_info():
    return 'Technology Tree service'

@app.route('/start-technology-develop', methods=['POST'])
def start_tech_develop_srv():
    data = request.get_json()
    new_technology = data.get('technology')
    file_path = 'tech-tree.yml'
    tech_tree = TechnologyTree(file_path)

    tech_tree.start_tech_develop(new_technology)


if __name__ == '__main__':
    print("starting service on 9983")
    app.run(port=9983)
