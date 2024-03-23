## Scenario
## Solution
- Execute the script given below
  ```
  #!/bin/bash

  # Download and Install Java
  yum install -y jdk-8u152-linux-x64.rpm

  #Variables
  JAVA_PATH=`readlink -f $(which java) | awk -F "bin" '{print $1}'`
  JAVA_KEYTOOL="$JAVA_PATH""bin/keytool"
  JAVA_CERTS="$JAVA_PATH""lib/security/cacerts"
  echo "$JAVA_KEYTOOL"
  echo "$JAVA_CERTS"

  #Add java keytool cerificate
  openssl s_client -connect sonar.example.com:443 -showcerts > prd-sonar.key </dev/null
  sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' prd-sonar.key  > prd-sonar-cert.pem
  csplit -k -f son-certs prd-sonar-cert.pem '/END CERTIFICATE/+1' {*}
  mv son-certs01 prd-sonar-cert.pem
  rm -rf son-certs*
  sleep 5
  echo -e "changeit\n" "yes" | $JAVA_KEYTOOL -import -alias sonar.example.com -keystore $JAVA_CERTS -file prd-sonar-cert.pem

  echo "=====================Java Keytool Certificate Installation Completed================"

  # Add host certificate

  #cd /etc/pki/tls/certs/
  #cp -pr ca-bundle.crt ca-bundle.crt.bak
  #openssl s_client -connect jenkins.example.com:443 -showcerts > prd-jenkins.key </dev/null
  #sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' prd-jenkins.key  > prd-jenkins-cert.pem
  #cat prd-jenkins-cert.pem >> ca-bundle.crt
  #rm -rf prd-jenkins*
  #cd /tmp
  #echo "======Host Certificate added==========="

  #Test SSLPoke connectivity
  #cd
  #wget http://confluence.atlassian.com/kb/files/779355358/779355357/1/1441897666313/SSLPoke.class --no-check-certificate
  java SSLPoke sonar.example.com 443
  ```
