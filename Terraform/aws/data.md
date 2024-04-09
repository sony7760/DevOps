## About
It allows Terraform to dynamically gather information about existing resources or external entities without needing to manage those resources directly.

## Create
- Create a data.tf file
  ```
  mkdir -p aws
  ```
  ```
  vim data.tf
  ```
  ```
  data "aws_s3_bucket" "existing_bucket" {
    bucket = "bucket_name"
}
  ```
- Create a output.tf file which shows you how to map(dynamically) data from data.tf file
  ```
  vim output.tf
  ```
  ```
  /*terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 4.16"
      }
    }
    required_version = ">= 1.2.0"
  }

  provider "aws" {
    region  = "ap-south-1"
  }*/
  output "bucket_id" {
    value = data.aws_s3_bucket.existing_bucket.id
  }
  output "bucket_arn" {
    value = data.aws_s3_bucket.existing_bucket.arn
  }
  output "bucket_region" {
    value = data.aws_s3_bucket.existing_bucket.region
  }
  output "bucket_domain_name" {
    value = data.aws_s3_bucket.existing_bucket.bucket_domain_name
  }
  ```
#### Deploy
- Follow the [link](../README.md) to proceed with commands
