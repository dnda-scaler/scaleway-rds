# Goal
Set of resources to help for creating Scaleway RDS resources through terraform.
3 resources have been provided :
- RDS without VPC create a database that can be access through internet
- RDS with VPC create a database that can be access Scaleway Private Network
In that case , a scaleway instance have been deployed with the psql client but the Public Gateway NAT can also be used*
- RDS with Read Replica create a database with Read Replica
# Deployment
1. Choose your example
2. Rename terraform.tfvars.template -> terraform.tfvars
3. Fill the terraform.tfvars
4. terraform init 
5. terraform apply

Database can be access using psql


Fichier config in OUTPUTS OF TERRAFORM for 01-without-vpc