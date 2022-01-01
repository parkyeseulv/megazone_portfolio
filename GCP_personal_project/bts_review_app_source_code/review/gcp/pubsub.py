import json
import logging
import os
project_id = 'hybrid-bts' #os.getenv('GCLOUD_PROJECT')

from google.cloud import pubsub_v1
from flask import current_app

publisher = pubsub_v1.PublisherClient()
topic_path = publisher.topic_path(project_id, 'review')
sub_client = pubsub_v1.SubscriberClient()
sub_path = sub_client.subscription_path(project_id, 'worker-subscription')

"""
Publishes review info
- jsonify review object
- encode as bytestring
- publish message
- return result
"""
def publish_review(review):
# Publish the review object to the review topic
    payload = json.dumps(review, indent=2,
                         sort_keys=True)
    data = payload.encode('utf-8')
    future = publisher.publish(topic_path, data=data)
    return future.result()

"""
pull_review
Starts pulling messages from subscription
- receive callback function from calling module
- initiate the pull providing the callback function
"""
def pull_review(callback):
    # Subscribe to the worker-subscription,
    # invoking the callback
    sub_client.subscribe(sub_path, callback=callback)
    
