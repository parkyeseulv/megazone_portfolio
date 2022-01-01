#!/bin/bash

echo "Exporting GCLOUD_PROJECT"
export GCLOUD_PROJECT=$DEVSHELL_PROJECT_ID

echo "Creating virtual environment"
mkdir ~/venvs
virtualenv -p python3 ~/venvs/reviewapp
source ~/venvs/reviewapp/bin/activate

echo "Installing Python libraries"
pip install --upgrade pip
pip install -r requirements.txt

echo "Creating Cloud Pub/Sub topics"
gcloud pubsub topics create review
gcloud pubsub subscriptions create worker-subscription --topic review

echo "Creating Cloud Spanner Instance, Database, and Table"
gcloud spanner instances create review-instance --config=regional-asia-northeast3 --description="review instance" --nodes=1
gcloud spanner databases create review-database --instance review-instance --ddl "CREATE TABLE review ( reviewId STRING(100) NOT NULL, review STRING(MAX), rating INT64, score FLOAT64, timestamp INT64 ) PRIMARY KEY (reviewId);"

echo "Project ID: $DEVSHELL_PROJECT_ID"