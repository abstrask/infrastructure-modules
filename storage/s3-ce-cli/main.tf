terraform {
  backend "s3" {
  }
}

provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn = var.aws_assume_role_arn
  }
}

module "bucket" {
  source    = "../../_sub/storage/s3-bucket"
  s3_bucket = var.bucket_name
}

module "iam_inventory_role_policy" {
  source  = "../../_sub/storage/s3-bucket-object"
  bucket  = module.bucket.bucket_name
  key     = "aws/iam/inventory-role/policy.json"
  content = data.template_file.iam_inventory_role_policy.rendered
}

module "iam_inventory_role_trust" {
  source  = "../../_sub/storage/s3-bucket-object"
  bucket  = module.bucket.bucket_name
  key     = "aws/iam/inventory-role/trust.json"
  content = data.template_file.iam_inventory_role_trust.rendered
}