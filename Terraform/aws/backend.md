## About
A backend is a configuration block that defines where Terraform will store its state file, which keeps track of the current state of the managed infrastructure

## Create
- Create a backend.tf file
  ```
  mkdir -p aws
  ```
  ```
  vim backend.tf
  ```
  ```
  terraform {
  backend "s3" {
    bucket = "bucket_name"
    key    = "remote.tfstate"
    region = "ap-south-1"
    encrypt = "true"
   }
  }
  ```
#### Deploy
- Follow the [link](../README.md) to proceed with commands
