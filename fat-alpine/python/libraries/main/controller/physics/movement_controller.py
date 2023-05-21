from flask import Blueprint, jsonify, request

from main.controller.common import bad_request
from main.model.math2.main.shapes import Rectangle

physics_api_bp = Blueprint('movement_api', __name__)


@physics_api_bp.route('/rectangle/surface', methods=['POST'])
def calculate_rectangle_surface():
    length, width = get_params()
    if length < 0 or width < 0:
        return bad_request('Length and width must be positive')
    surface = Rectangle(length, width).surface()
    return jsonify({'surface': surface})


def get_params():
    try:
        length = float(request.json['length'])
        width = float(request.json['width'])
        return length, width
    except ValueError:
        return bad_request('Length and width must be numeric')

