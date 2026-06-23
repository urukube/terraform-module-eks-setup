#!/bin/bash
# This script returns pipeline environment variables as JSON for Terraform's external data source
# Required env vars: MASTER_S3_DIRECTORY, TF_STATE_BUCKET

cat <<EOF
{
  "master_s3_directory": "${MASTER_S3_DIRECTORY}",
  "tf_state_bucket": "${TF_STATE_BUCKET}"
}
EOF
