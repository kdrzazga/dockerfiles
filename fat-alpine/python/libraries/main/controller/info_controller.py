from flask import Blueprint

info_api_bp = Blueprint('info_api', __name__)


@info_api_bp.route('/', methods=['GET'])
def api_info():
    return '''<h1>Math2 API</h1>
              <p>This API calculates the surface and perimeter of a rectangle.</p>
              <p>Example requests:</p>
              <ul>
                <li>POST /rectangle/surface -d "length=5" -d "width=3"</li>
                <li>POST /rectangle/perimeter -d "length=5" -d "width=3"</li>
              </ul>'''
