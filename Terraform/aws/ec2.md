## About
This is for provisioning an ec2 instance

#### Workspace
- Create a directory for workspace
  ```
  mkdir ec2
  ```
  ```
  cd ec2/
  ```
- Create configurations
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
  ```
