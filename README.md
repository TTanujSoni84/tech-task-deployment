# Tech-task

This tech task contains the step by step procedure to create infrastructure on AWS using Terraform, installation of all required packages on ec2 instance using Ansible and deployment of dockerized microservice on EC2 using Jenkins.  

# Prerequisites 

- aws-cli
- Terraform
- Ansible

# Steps to create infrastructure using Terraform 


**Step 1:** We need to create `key pairs` under the Network & Security in EC2 section and update keyname in terraform variable in file `dev.tfvars` , param name: `key_pair_name`.


**Step 2:** Goto the Terraform folder and initialize terraform.
```
$ terraform init
```

**Step 3:** Shows Terraform configuration(optional).
```
$ terraform plan -var-file=dev.tfvars
```

**Step 4:** Terraform apply on infrastruture.
```
$ terraform apply -var-file=dev.tfvars
```

If we want to destory Terraform environemnt then use:
```
$ terraform destroy -var-file=dev.tfvars
```

# Steps to install dependencies using Ansible 

**Step 1:** One the AWS infrastructure is generated by Terraform, download the .pem for EC2 instance and change it's permission to `chmod 400 path-for-pem-file` . After that, update it's path in file `configure_env.sh` file:
```
PEM_FILE_PATH=<Path for the .pem file>
```

If we want to change any other config, we can do it from here like changing of Jenkins admin password.


**Step 2:** Run the shell script file to update the environment variables:
```
$ sh configure_env.sh
```


**Step 3:** Change directory and go to the folder Ansible 


**Step 4:** Ansible playbook command 
```
$ ansible-playbook -u ubuntu jenkins.yml -i hosts
```

# Enable the CI/CD

To enable the CI/CD process, we need to add webhook [like this http://EC2-PUBLIC-IP:8080/github-webhook/] in out github repository.


Once the script run successfully, you can replace public IP in following API and test it:

```<IP Address>/health-check``` 
```<IP Address>/api/v1/fetch_jokes```

Currently, the App is running on following server:

```<IP Address>/health-check``` 
```<IP Address>/api/v1/fetch_jokes```
