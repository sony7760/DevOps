## Scenario
- The command `curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg` is failing due to unknown certificate issuer.
- **apt-get update** also fail in this situation
- Error looks like given below,
```
root@node2:~# curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
curl: (60) SSL certificate problem: unable to get local issuer certificate
More details here: https://curl.se/docs/sslcerts.html
curl failed to verify the legitimacy of the server and therefore could not
establish a secure connection to it. To learn more about this situation and
how to fix it, please visit the web page mentioned above.
gpg: no valid OpenPGP data found.
```
- The given solution is applicable for any of the domain(NOT only for pkgs.k8s.io) in the similar case.
## Solution
- Download SSL for the failed domain
```
openssl s_client -showcerts -connect pkgs.k8s.io:443 </dev/null 2>/dev/null | sed -n '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/p' > pkgsk8s.crt
```
- Move the downloaded file to the cert location
```
mv pkgsk8s.crt /usr/local/share/ca-certificates/
```
- Update certificates db
```
update-ca-certificates
```
  - Ouput looks like given below
    ```
    root@node2:~# update-ca-certificates
    Updating certificates in /etc/ssl/certs...
    rehash: warning: skipping ca-certificates.crt,it does not contain exactly one certificate or CRL
    rehash: warning: skipping pkgsk8s.pem,it does not contain exactly one certificate or CRL
    1 added, 0 removed; done.
    Running hooks in /etc/ca-certificates/update.d...
    done.
    ```
- Retry failed commands!
