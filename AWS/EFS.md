## Amazon Elastic File System (EFS)
It is designed to provide scalable, highly available, and durable storage for EC2 instances, enabling multiple instances to share and access the same file system concurrently.
#### Key features:
- Scalable and Elastic:
  - EFS automatically scales storage capacity up or down as you add or remove files, without the need for manual intervention.
- Highly Available and Durable:
  - EFS stores data redundantly across multiple Availability Zones (AZs) within a region to ensure high availability and durability.
- Supports NFS Protocol:
  - EFS uses the Network File System (NFS) version 4 protocol, making it compatible with Linux-based applications and instances.
- Concurrent Access:
  - Multiple EC2 instances within a VPC can concurrently access an EFS file system, making it suitable for applications with shared storage requirements.
- Lifecycle Management:
  - EFS supports lifecycle management policies that allow you to automatically move files to the EFS Infrequent Access storage class after a certain period of inactivity.
#### Configurations:
- Prerequisites:
  - create a VPC with public/private subnet(according to your requirement).
  - create security groups as given below
  - create a private key to access EC2 instance
- Create an EFS File System:
  - Go to the AWS Management Console and navigate to the Amazon EFS service.
  - Click "Create file system" and follow the steps given below
