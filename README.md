# Goal
Set of terraform resources to help for creating Scaleway RDS resources through terraform.
3 resources have been provided :
- RDS without VPC create a database that can be access through internet
- RDS with VPC create a database that can be access Scaleway Private Network
In that case , a scaleway instance have been deployed with the postgreSQL client but the Public Gateway NAT can also be used*

# Prerequisites
- node >=14
- Terraform

# Deployment
1. Choose your example (VPC|not)
2. Rename terraform.tfvars.template -> terraform.tfvars
3. Rename provider.tf.template -> provider.tf
4. Provide provider info
3. Fill the terraform.tfvars
4. terraform init 
5. terraform apply

# Access without VPC
1. Open the nodeJS CLient folder
2. npm i
3. npm run dev

CLuster can be used
Folliwng API can be used to intecact with the database
- User Creation
 ```
 curl --location --request POST 'http://localhost:5000/user' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name":"damien2",
    "email":"foo2@scaleway.com"
}'
```
- User Rertieve
```
curl --location --request GET 'http://localhost:5000/user/2ec8542f-55cc-4989-8ae3-3ed9c1e47582'
```

Database can be access using psql
Config File is output in a config folder at project root.

# For VPC Access
You will have to connect to your data using SSL Connection to the instance provisionned for that purpose
- You need for that to configure the ssh Bastion for the Public Gateway https://www.scaleway.com/en/docs/network/vpc/how-to/use-ssh-bastion/
- Connect to the instance

For Now THE Redis Attachment to VPC is still in beta 
