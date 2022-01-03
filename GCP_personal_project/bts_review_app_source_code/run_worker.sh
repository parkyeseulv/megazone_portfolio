echo "Exporting GCLOUD_PROJECT"
export GCLOUD_PROJECT=$DEVSHELL_PROJECT_ID

echo "Switching to virtual environment"
source ~/venvs/reviewapp/bin/activate

echo "Starting worker"
python -m review.console.worker
