## Identity & Access Management
AWS Identity and Access Management (IAM) is a web service provided by Amazon Web Services (AWS) that enables you to manage access to AWS services and resources securely. IAM allows you to control and customize access permissions for users, groups, and roles within AWS account

#### Users:
IAM allows you to create and manage users within your AWS account. Each user has a unique set of security credentials (access key and secret key) that can be used to interact with AWS services programmatically

#### Groups:
Users can be organized into groups, and permissions can be assigned to groups rather than individual users. This simplifies access management, especially when dealing with multiple users with similar access needs

#### Roles:
IAM roles are entities with permissions that determine what other AWS services and resources a user, group, or service can access. Roles are often used to grant permissions to AWS resources without the need for long-term credentials

#### Policies:
 Policies are JSON documents that define permissions. Policies can be attached to users, groups, and roles to specify what actions are allowed or denied on what resources
