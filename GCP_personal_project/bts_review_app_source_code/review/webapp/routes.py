"""
Set up Flask stuff
"""

from review.api import api
from flask import Blueprint, render_template
from flask import send_from_directory
from flask import request, redirect

"""
configure blueprint
"""
webapp_blueprint = Blueprint(
    'webapp',
    __name__,
    template_folder='templates',
)

"""
Renders home page
"""
@webapp_blueprint.route('/')
def serve_home():
    return send_from_directory('webapp/static/client', 'index.html')

"""
Serves static files used by angular client app
"""
@webapp_blueprint.route('/<path:path>')
def serve_client_files(path):
    return send_from_directory('webapp/static/client', path)


"""
Serves static file with angular client app
"""
#@webapp_blueprint.route('/client/')
#def serve_client():
#    return send_from_directory('webapp/static/client', 'index.html')

#@webapp_blueprint.route('/review')
#def serve_review():
#    return send_from_directory('webapp/static/client', 'review.html')