### Terraform installation
- Select terraform package based on your OS. In this example it shows how to install terraform on Ubuntu OS
  ```
  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  ```
  ```
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  ```
  ```
  apt update
  ```
  ```
  apt install terraform
  ```
### Validate the installation
- Execute the command for terraform version check
  ```
  terraform --version
  ```
