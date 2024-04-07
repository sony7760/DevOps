## About
This is for provisioning an ec2 instance using terraform

#### Workspace
- Create a directory for workspace
  ```
  mkdir ec2
  ```
  ```
  cd ec2/
  ```
#### Configuration
- Create terraform file
  ```
  vim ec2.tf
  ```
  ```
  terraform {
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
  }

  resource "aws_instance" "web_server" {
    ami           = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    tags = {
    Name = "webserver"
    }
  }
  ```
#### Deploy
- Follow the [link](../README.md) to proceed with commands
