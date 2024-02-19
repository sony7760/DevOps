#### Assignment 1: Setting Up AWS Instance Profile and GitLab CI/CD Runner
- Setting up an AWS Instance Profile:
  - Create a new IAM Role in AWS with an appropriate name (e.g., GitLabCI-Role).
  - Attach a managed policy that grants the necessary permissions for your CI/CD jobs. Ensure minimal, least privilege permissions.
  - Create an Instance Profile and associate it with the IAM Role.
- EC2 Instance Setup:
  - Launch a new EC2 instance and configure the instance with the IAM Role you created.
  - Ensure the instance has the necessary security group settings for GitLab CI/CD (e.g., allowing outbound HTTP/HTTPS traffic).
  - Install and configure the GitLab Runner on the EC2 instance.
    - Register the runner with your GitLab instance.
    - Use the GitLab Runner token obtained from your GitLab project settings.
- GitLab CI/CD settings:
  - Create _.gitlab-ci.yml_ file in your GitLab project repository to include a job that will run on the AWS instance.
  - Make sure the CI/CD job is running to manage resources in the AWS according the role you given.
## Assignment 2: Setting Up a Bastion Host in AWS
- Setting up a VPC:
  - Create a new Virtual Private Cloud (VPC) with an appropriate CIDR block.
  - Include at least two subnets: one public subnet and one private subnet.
- Bastion Host Setup:
  - Launch an EC2 instance as the Bastion host is placed in the public subnet.
  - Configure security groups for the Bastion host:
    - Allow SSH access (port 22) only from your IP address.
    - Allow outbound All-traffic from anywhere.
- Private Instance Setup:
  - Launch a private EC2 instance in the private subnet.
  - Configure security groups for the private instance:
    - Allow inbound traffic only from the Bastion host on necessary ports.
    - Allow outbound All-traffic from anywhere.
- SSH Configuration:
  - Connect to the Bastion host using SSH. Provide the necessary steps for accessing the Bastion host securely.
  - From the Bastion host, SSH into the private instance. Explain how to set up SSH forwarding for secure connections.
## GuideLines:
- Submit a well-organized document with clear headings and step numbers.
- Include all necessary screenshots and code snippets.
- Clearly explain the purpose and rationale behind each step.
- Ensure that your setup follows security best practices.
- Add troubleshooting steps,  If you encounter any issues during the setup.
- Use GitLab project to do the needful

**Note:** Make sure to adhere to AWS free tier limits to avoid unexpected charges.
