cd terraform
terraform init
terraform plan -out out.terraform
terraform apply out.terraform
rm out.terraform 
