## Runner
GitLab Runner is an open-source project that is used to run pipeline jobs and send the results back to GitLab. It is a part of the GitLab CI/CD ecosystem and is responsible for executing tasks defined in .gitlab-ci.yml files

Here are the basic steps to configure GitLab Runner,
#### Install GitLab Runner:
Install GitLab Runner on a machine where you want to run your CI/CD jobs. You can install it on your own infrastructure, a cloud provider, or any server that meets your requirements.

For example, on a Ubuntu Linux system, you might use:
```
sudo curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt-get install gitlab-runner
```
For other operating systems, refer to the official configuration [documentation](https://docs.gitlab.com/runner/)

#### Register Runner:
After installation, it need to register the runner with the GitLab. Run the following command and provide appropriate inputs,
```
sudo gitlab-runner register
```
- Enter the GitLab instance URL, eg: https://gitlab.com
- Provide a token, which you can obtain from the GitLab project's CI/CD settings
- Specify a description for your runner, eg: JavaAppRunners
- You can set multiple tags for the runner using comma, eg: java,maven,docker
- Choose the executor. Docker is a commonly used executor, but there are others like Shell, Kubernetes, etc
####  Configure Runner:
The runner configuration is stored in the **/etc/gitlab-runner/config.toml** file. You can manually edit this file if needed
#### Start/Stop/Restart/Status Runner:
```
sudo gitlab-runner start
```
