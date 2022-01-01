import json

from flask import Response

"""
Import shared GCP helper modules
"""
from review.gcp import pubsub

"""
Publish review
- Call pubsub helper
- Compose and return response
"""
def publish_review(review):
    # Publish the feedback using pubsub module,
    # return the result
    result = pubsub.publish_review(review)
    response = Response(json.dumps(result, indent=2,
                                   sort_keys=True))
    response.headers['Content-Type'] = 'application/json'
    return response
