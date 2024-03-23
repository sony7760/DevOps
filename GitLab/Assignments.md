## Assignment 1: Jenkins CI/CD Setup
- Install Jenkins:
  - Install Jenkins on your local machine or a cloud server.
- Jenkins Configuration:
  - Configure Jenkins with any necessary plugins for your project (e.g., Git plugin, Pipeline plugin).
- Create a Jenkins Pipeline(Declerative):
  - Create a Jenkins pipeline using a Jenkinsfile. This pipeline should:
    - Fetch the source code from a Git repository.
    - Build the project.
    - Run tests.
    - If the tests pass, deploy the application to a test environment.
- Version Control Integration:
  - Integrate Jenkins with a version control system (e.g., GitHub, BitBucket, GitLab).
  - Set up a webhook or configure Jenkins to poll the version control system for changes.
- Pipeline Visualization:
  - Use Jenkins to visualize the pipeline stages and results.
  - Ensure that developers can easily track the progress of builds and deployments.
- Notification:
  - Configure Jenkins to send email notifications:
    - When a build is successful.
    - When a build fails.
- Parameterized Builds:
  - Modify your Jenkins pipeline to support parameterized builds. For example, allow users to choose which branch to build or deploy.
## GuideLines:
- Submit a well-organized document with clear headings and step numbers.
- Include all necessary screenshots and code snippets.
- Clearly explain the purpose and rationale behind each step.
- Ensure that your setup follows security best practices.
- Add troubleshooting steps,  If you encounter any issues during the setup.
- Use GitLab project to do the documentation