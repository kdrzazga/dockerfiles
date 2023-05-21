from flask import jsonify


def bad_request(message):
    response = jsonify({'error': message})
    response.status_code = 400
    return response
