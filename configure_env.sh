#!/bin/sh

## This is newly created ec2 instance public IP.
PUBIP="$(cat PUBLIC_IP.TXT)"

## Working Directory of project.
PROJECT_PATH="$(pwd)"

# Jenkins admin password.
ADMIN_PASS=admin123

# Pem file path for the EC2 instance.
PEM_FILE_PATH="<PEM File path here>"


## IP replaced in varibles file
sed -i 's/PUBLIC_IP/'$PUBIP'/g' ansible/variables.yml
## IP replaced in hosts file
sed -i 's/PUBLIC_IP/'$PUBIP'/g' ansible/hosts
## Pem file path replaced in hosts file
sed -i 's|AWS_PRIVATE_KEY_PATH|'$PEM_FILE_PATH'|g' ansible/hosts

echo "Instance Public IP is '$PUBIP' "

sed -i 's|PROJECT_DIR|'$PROJECT_PATH'|g' ansible/variables.yml

sed -i 's/ADMIN_PASSWORD/'$ADMIN_PASS'/g' ansible/variables.yml

sed -i 's/ADMIN_PASSWORD/'$ADMIN_PASS'/g' ansible/setup-jenkins-cli.sh