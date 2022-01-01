
from review.api import api

from flask import request, Blueprint

api_blueprint = Blueprint('api', __name__)

"""
API endpoint for review
"""
#@api_blueprint.route('/', methods=['POST'])
#def review_method():
#    review = request.get_json()
#    return api.publish_review(review)

@api_blueprint.route('/review', methods=['POST'])
def review_method():
    review = request.get_json()
    return api.publish_review(review)