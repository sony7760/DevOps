## Scenario
- The command `curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg` is failing due to unknown certificate issuer.
- Screenshot of the error has attached.
- This solution is applicable for any of the domain(NOT only for pkgs.k8s.io) in the similar case.
