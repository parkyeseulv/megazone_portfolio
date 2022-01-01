#!/bin/bash

export GCLOUD_PROJECT='hybrid-bts'

echo "Run main and worker server"
source ~/venvs/reviewapp/bin/activate
python3 run_server.py
python3 -m review.console.worker