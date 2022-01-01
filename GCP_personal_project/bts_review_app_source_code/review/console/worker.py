import logging
import sys
import time
import json

from review.gcp import pubsub, languageapi, spanner

"""
Receives pulled messages, analyzes and stores them
- Acknowledge the message
- Log receipt and contents
- convert json string
- call helper module to do sentiment analysis
- log sentiment score
- call helper module to persist to spanner
- log feedback saved
"""
def pubsub_callback(message):
    message.ack()
    data = json.loads(message.data)

    # Use the languageapi module to
    # analyze the sentiment
    score = languageapi.analyze(str(data['review']))

    # Assign the sentiment score to
    # a new score property
    data['score'] = score
    
    # Use the spanner module to save the feedback
    spanner.save_review(data)
    
"""
Pulls messages and loops forever while waiting
- initiate pull
- loop once a minute, forever
"""
def main():
    pubsub.pull_review(pubsub_callback)
    
    while True:
        time.sleep(60)

if __name__ == '__main__':
    main()
