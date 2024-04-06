## About
[Terraform](https://developer.hashicorp.com/terraform?product_intent=terraform) is an open-source Infrastructure as Code (IaC) software tool created by HashiCorp. It allows users to define and provision data center infrastructure using a high-level configuration language, which can be versioned, shared, and reused across teams. Terraform manages resources across various cloud providers, on-premises environments, and Software as a Service (SaaS) offerings, enabling infrastructure automation and scalability

These commands given below for managing infrastructure with Terraform

#### terraform init:
Initializes a Terraform working directory by downloading necessary provider plugins and setting up the backend

#### terraform validate: 
Validates the configuration files for correct syntax and configuration settings, ensuring they are properly formatted and usable

#### terraform fmt:
Formats the Terraform configuration files to a consistent style, improving readability and maintainability.

#### terraform plan: 
Generates an execution plan, showing what actions Terraform will take to change the infrastructure based on the current configuration

#### terraform apply: 
Applies the changes required to reach the desired state of the configuration, creating, modifying, or deleting resources as necessary

#### terraform destroy:
Destroys all the resources defined in the Terraform configuration, effectively tearing down the infrastructure

#### terraform show: 
Displays the current state or detailed information about the resources managed by Terraform
