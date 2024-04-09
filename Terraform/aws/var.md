## About
Variables in Terraform allow users to parameterize their infrastructure code, making it more flexible and reusable

#### Workspace
- Create a directory for workspace
  ```
  mkdir -p aws
  ```
  ```
  cd aws/
  ```
#### Configuration
- Create terraform file
  ```
  vim variable.tf
  ```
  ```
  variable "region" {
    type = string
    default = "ap-south-1"
  }
  variable "type" {
    type = string
    default = "t2.micro"
  }
  variable "tag" {
    type = string
    default = "frontend"
  }
  variable "image" {
    type = string
    default = "ami-007020fd9c84e18c7"
  }
  ```
- Create ec2 instance
  ```
  vim ec2_1.tf
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
    region  = var.region
  }*/

  resource "aws_instance" "app_server" {
    ami           = var.image
    instance_type = var.type
    tags = {
    Name = var.tag
    }
  }
  ```
#### Deploy
- Follow the [link](../README.md) to proceed with commands
