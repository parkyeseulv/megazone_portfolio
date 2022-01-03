from review.api import api
from flask import request, Blueprint

api_blueprint = Blueprint('api', __name__)

@api_blueprint.route('/review', methods=['POST'])
def review_method():
    review = request.get_json()
    return api.publish_review(review)