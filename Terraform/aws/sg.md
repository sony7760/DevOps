## About
This is for provisioning an security group using terraform

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
  vim sg.tf
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

  resource "aws_security_group" "web_server-sg" {
    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "allow http"
    }
    tags  = {
      Name = "webserver-sg"
    }
  }
  ```
#### Deploy
- Follow the [link](../README.md) to proceed with commands

