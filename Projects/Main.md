## Building a Scalable Microservices Architecture for your Application
This project is for architecting and implementing a DevOps practice for a growing application platform. The platform currently consists of monolithic applications, and the goal is to refactor it into a microservices architecture to improve scalability, reliability, and maintainability. The pipeline should automate the deployment process, ensure infrastructure consistency, and streamline development workflows. The application is a microservices-based architecture deployed on Kubernetes clusters. Your solution should leverage various DevOps tools to automate the software delivery process, improve deployment reliability, and enhance scalability

### Components to be utilized
**IaC - Terraform:**
- Use Terraform to define the infrastructure as code for deploying the CI/CD tool on AWS
- Use Terraform to define the infrastructure as code for deploying the microservices architecture on AWS
- Utilize Terraform modules to manage resources such as EC2 instances, VPC, subnets, security groups, and load balancers etc...

**CI/CD - Jenkins:**
- Implement a Jenkins pipeline to automate the build, test, and deployment processes for microservices
- Integrate Jenkins with the code repository (GitLab) to trigger builds upon code commits and pull requests(MR/PR)

**Cloud - AWS:**
- Deploy the microservices infrastructure on AWS, leveraging services like EC2, RDS (Relational Database Service), and S3 (Simple Storage Service), Route53 etc...
- Implement auto-scaling and load balancing to handle varying traffic loads efficiently

**Configuration Management Tool - Ansible:**
- Use Ansible for configuring and managing the software components within the infrastructure, ensuring consistency and repeatability across environments
- Automate tasks such as software installation, configuration file management, and service orchestration

**Code Repository - GitLab:**
- Use GitLab as the central code repository for storing and versioning the microservices source code
- Implement branching strategies and merge request workflows for collaborative development

**Application Build Tool - Maven:**
- Utilize Maven for building and managing dependencies for Java-based microservices
- Integrate Maven with Jenkins for automated builds as part of the CI/CD pipeline

**Packaging - Docker:**
-  Containerize each microservice using Docker to encapsulate dependencies and ensure consistency across environments
-  Create Docker images for each microservice, including necessary dependencies and configurations

**Container Registry - GitLab:**
- Set up a private container registry within GitLab for storing Docker images
- Enable Docker image pull actions from the K8s

### Project Deliverables
**Project Plan and Architecture Design Document:**
- Detailed plan outlining the project scope, objectives, timeline, and resource requirements
- Architecture diagram depicting the CI/CD pipeline workflow, AWS infrastructure layout, and Kubernetes cluster architecture

**Source Code Repository:**
-  GitLab repository containing the application code, infrastructure configurations, and CI/CD pipeline scripts

**Documentation and User Guides:**
- Comprehensive documentation covering setup instructions, usage guidelines, and troubleshooting procedures for the CI/CD pipeline and associated tools

**Demo and Presentation:**
- Live demonstration of the implemented CI/CD pipeline showcasing automated build, test, and deployment processes
- Presentation summarizing the project goals, challenges, solutions, and key learnings

