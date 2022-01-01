#!/bin/bash

gcloud auth activate-service-account vm-ser-acc@hybrid-bts.iam.gserviceaccount.com \
--key-file='./credentials.json' --project=hybrid-bts

#gcloud pubsub topics create review
#gcloud pubsub subscriptions create worker-subscription --topic review
#gcloud spanner instances create review-instance --config=regional-asia-northeast3 --description="review instance" --nodes=1
#gcloud spanner databases create review-database --instance review-instance --ddl "CREATE TABLE review ( reviewId STRING(100) NOT NULL, review STRING(MAX), rating INT64, score FLOAT64, timestamp INT64 ) PRIMARY KEY (reviewId);"
