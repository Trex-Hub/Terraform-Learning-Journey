output "helloUser" {
  value = "Hello I'm ${var.username} and I'm ${var.age} year's old "
}

# Command used for default TFVAR File `terraform plan`

# Command used for Custom TFVAR File `terraform plan -var-file=development.tfvars `

# Use Case => 
# 1. Different value for Testing and Production Environment.
# 2. Can be used to check the difference between 2 Setting

