from flask import Flask
from review.api.routes import api_blueprint
from review.webapp.routes import webapp_blueprint

app = Flask(__name__, static_folder='static')

app.register_blueprint(api.routes.api_blueprint, url_prefix='/api')
app.register_blueprint(webapp.routes.webapp_blueprint, url_prefix='')