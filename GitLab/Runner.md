## Runner
GitLab Runner is an open-source project that is used to run pipeline jobs and send the results back to GitLab. It is a part of the GitLab CI/CD ecosystem and is responsible for executing tasks defined in .gitlab-ci.yml files

### Here are the basic steps to configure GitLab Runner:
#### Install GitLab Runner:
Install GitLab Runner on a machine where you want to run your CI/CD jobs. You can install it on your own infrastructure, a cloud provider, or any server that meets your requirements.

For example, on a Ubuntu Linux system, you might use:
bash```
sudo curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt-get install gitlab-runner
```
