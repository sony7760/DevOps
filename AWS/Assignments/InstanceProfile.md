## Assignment: Setting Up AWS Instance Profile and GitLab CI/CD Runner
**Objective:** The objective of this assignment is setting up an AWS Instance Profile and configuring an EC2 instance as a GitLab CI/CD Runner.

### Guidelines:
**AWS Instance Profile:**
- Create a new IAM Role in AWS with an appropriate name (e.g., GitLabCI-Role).
- Attach a managed policy that grants the necessary permissions for your CI/CD jobs. Ensure minimal, least privilege permissions.
- Create an Instance Profile and associate it with the IAM Role.

**EC2 Instance Setup:**
- Launch a new EC2 instance and configure the instance with the IAM Role you created.
- Ensure the instance has the necessary security group settings for GitLab CI/CD (e.g., allowing outbound HTTP/HTTPS traffic).
- Install and configure the GitLab Runner on the EC2 instance.
  - Register the runner with your GitLab instance.
  - Use the GitLab Runner token obtained from your GitLab project settings.

**GitLab CI/CD Configuration:**
- Create _.gitlab-ci.yml_ file in your GitLab project repository to include a job that will run on the AWS instance.
- Make sure the CI/CD job is running to manage resources in the AWS according the role you given.

**Assignment Submission:**
- Submit a well-organized document with clear headings and step numbers.
- Include all necessary screenshots and code snippets.
- Clearly explain the purpose and rationale behind each step.
- Ensure that your setup follows security best practices.
- Add troubleshooting steps,  If you encounter any issues during the setup.

**Note:** Make sure to adhere to AWS free tier limits to avoid unexpected charges.
