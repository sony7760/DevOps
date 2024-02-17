## Assignment: Setting Up a Bastion Host in AWS
**Objective:** The goal of this assignment is to setting up a Bastion host in an AWS environment. A Bastion host is a secure instance that acts as a gateway for connecting to other instances in a private subnet.

### Guidelines:
**VPC Creation:**
- Create a new Virtual Private Cloud (VPC) with an appropriate CIDR block.
- Include at least two subnets: one public subnet and one private subnet.

**Bastion Host Setup:**
- Launch an EC2 instance as the Bastion host is placed in the public subnet.
- Configure security groups for the Bastion host:
  - Allow SSH access (port 22) only from your IP address.
  - Allow outbound All-traffic from anywhere.

**Private Instance Setup:**
- Launch a private EC2 instance in the private subnet.
- Configure security groups for the private instance:
  - Allow inbound traffic only from the Bastion host on necessary ports.
  - Allow outbound All-traffic from anywhere.

**SSH Configuration:**
- Connect to the Bastion host using SSH. Provide the necessary steps for accessing the Bastion host securely.
- From the Bastion host, SSH into the private instance. Explain how to set up SSH forwarding for secure connections.

**Testing:**
- Demonstrate successful connectivity from your local machine to the Bastion host and from the Bastion host to the private instance.

**Assignment Submission:**
- Submit a well-organized document with clear headings and step numbers.
- Include all necessary screenshots and code snippets.
- Clearly explain the purpose and rationale behind each step.
- Ensure that your setup follows security best practices.
- Add troubleshooting steps,  If you encounter any issues during the setup.

**Note:** Make sure to adhere to AWS free tier limits to avoid unexpected charges.
