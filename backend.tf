terraform {
  backend "s3" {
    bucket  = "terraform-deploy-pipeline-no-creds"
    key     = "test-rep/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}
