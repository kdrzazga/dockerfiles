from flask import Flask
from controller.info_controller import info_api_bp
from main.controller.math2.rectangle_controller import math2_api_bp
from main.controller.physics.movement_controller import physics_api_bp

app = Flask(__name__)
app.register_blueprint(math2_api_bp)
app.register_blueprint(physics_api_bp)
app.register_blueprint(info_api_bp)

if __name__ == '__main__':
    app.run()
