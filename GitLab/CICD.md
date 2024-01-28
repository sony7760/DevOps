## CICD
CI/CD (Continuous Integration/Continuous Deployment) is a set of features provided by GitLab to automate the software development lifecycle. It's an integral part of the GitLab platform, allowing teams to implement CI/CD practices seamlessly within the same environment where they manage their source code. 

Here's an overview of GitLab CI/CD,

- Runner:
  - GitLab [Runner](./Runner.md) is an agent that runs jobs specified in the **.gitlab-ci.yml** file. It can be installed on servers, cloud providers, or even used with Docker containers
- GitLab CI/CD Configuration:
  - CI/CD is configured using a file named **.gitlab-ci.yml** placed in the root of the GitLab repository. This file defines pipelines, jobs, and their configurations
- Pipeline:
  - A pipeline is a series of stages & jobs defined in the **.gitlab-ci.yml** file. It represents the entire CI/CD process.
- Stages:
  - In GitLab CI/CD, pipeline stages are a way to organize and structure the different phases or steps of your CI/CD process. A pipeline is a series of stages, and each stage contains one or more jobs. Jobs within the same stage run concurrently, while stages run sequentially. This helps in organizing and visualizing the progression of the CI/CD process
```
  stages:
    - build
    - test
    - deploy
```
- job:
  - A job is a single task that is part of a pipeline. Jobs can include tasks such as compiling code, running tests, and deploying applications
```
Maven_build:
  stage: build
  script:
    - echo "Building the Maven application"

NPM_build:
  stage: build
  script:
    - echo "Building the Node application"

test:
  stage: test
  script:
    - echo "Running tests"

deploy:
  stage: deploy
  script:
    - echo "Deploying to production"
```
- Artifact:
  - Artifacts are files or directories created by a job that are passed between jobs in a pipeline. They can be used to share build outputs or dependencies
```
Maven_build:
  stage: build
  script:
    - echo "Building the Maven application"
  artifacts:
    paths:
      - target/                                ##It will create the whole target directory as artifact
```
- Variables:
  - GitLab CI/CD variables are a way to store and manage environment-specific or sensitive information that is needed during the CI/CD process. These variables can be set globally for an entire project or defined for specific jobs within the .gitlab-ci.yml configuration file. They are useful for passing parameters, credentials, or other configuration values to your CI/CD pipeline without exposing them directly in the code
    - **Project-level Variables:** In the GitLab project, it can set global variables that are accessible by all jobs in the CI/CD pipeline. Go to the project, navigate to **Settings > CI / CD > Variables**, and add the desired key-value pairs
    - **Job-level Variables in .gitlab-ci.yml:** It can define variables at the job level in your .gitlab-ci.yml file. These variables are specific to the job and override any global variables with the same name
