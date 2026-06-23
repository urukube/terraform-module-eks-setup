data "terraform_remote_state" "eks_infra" {
  backend = "s3"

  config = {
    bucket = data.external.pipeline_env.result.tf_state_bucket
    key    = "${data.external.pipeline_env.result.master_s3_directory}/eks_infra/terraform.tfstate"
    # region is picked from AWS_REGION env var set by aws-actions/configure-aws-credentials
  }
}

data "external" "pipeline_env" {
  program = ["bash", "${path.module}/get_env.sh"]
}
