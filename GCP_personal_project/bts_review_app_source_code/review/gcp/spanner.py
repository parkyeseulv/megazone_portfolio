import re
from google.cloud import spanner


"""
Get spanner management objects
"""

spanner_client = spanner.Client()
instance = spanner_client.instance('review-instance')
database = instance.database('review-database')

"""
Persists review data into Spanner
- create primary key value
- do a batch insert (even though it's a single record)
"""
def save_review(data):
    # Create a batch object for database operations
    with database.batch() as batch:
    
        # Create a key for the record
        # from timestamp
        review_id = '{}'.format(
                    data['timestamp'])
        
        # Use the batch to insert a record
        # into the review table
        # This needs the columns and values
        batch.insert(
            table='review',
            columns=(
                'reviewId',
                'review'
                'rating',
                'score',
                'timestamp'
            ),
            values=[
                (
                    review_id,
                    data['review']
                    data['rating'],
                    data['score'],
                    data['timestamp'],
                )
            ]
        )
        

