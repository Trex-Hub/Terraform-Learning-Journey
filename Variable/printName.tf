output "printName" {
  value = "Hello, ${var.username} is ${var.age} years old."
} 

# Pass single variable value in terminal =
  # terraform plan -var "username=Devendra"
# Pass multiple variable value in terminal =
  # terraform plan -var "username=Devendra" -var "age=20"