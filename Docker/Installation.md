## Installation
- To install Docker Engine, you need the 64-bit version of the Ubuntu version
- Set up Docker's apt repository
  - Add Docker's official GPG key
    ```
    apt-get update
    ```
    ```
    apt-get install ca-certificates curl
    ```
    ```
    install -m 0755 -d /etc/apt/keyrings
    ```
    ```
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    ```
    ```
    chmod a+r /etc/apt/keyrings/docker.asc
    ```
  - Add the repository to Apt sources
    ```
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    ```
    ```
    apt-get update
    ```
- Install the latest version
  ```
  apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  ```
- Verify docker is up & running
  ```
  systemctl status docker
  ```
- Reference Docker [official doc](https://docs.docker.com/engine/install/ubuntu/) for more reference
