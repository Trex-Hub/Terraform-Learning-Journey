output "helloUser" {
  value = "Hello I'm ${var.username} and I'm ${var.age} year's old "
}

# Command used for this terraform plan -var username="Devendra" -var age=21