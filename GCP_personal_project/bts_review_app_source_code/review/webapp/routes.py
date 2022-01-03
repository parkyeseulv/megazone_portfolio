from review.api import api
from flask import Blueprint, render_template
from flask import send_from_directory
from flask import request, redirect

webapp_blueprint = Blueprint(
    'webapp',
    __name__,
    template_folder='templates',
)

@webapp_blueprint.route('/')
def serve_home():
    return send_from_directory('webapp/static/client', 'index.html')

@webapp_blueprint.route('/<path:path>')
def serve_client_files(path):
    return send_from_directory('webapp/static/client', path)