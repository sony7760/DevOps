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
  data "aws_ami" "rhel" {
    most_recent = true
    owners = ["769417893008"]
    filter {
      name = "name"
      values = ["redHat-*"]
    }
    filter {
      name = "root-device-type"
      values = ["ebs"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
    filter {
      name = "architecture"
      values = ["x86_64"]
    }
  }
  ```
- Create a ec2_1.tf file which shows you how to map data from data.tf file
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
  ```