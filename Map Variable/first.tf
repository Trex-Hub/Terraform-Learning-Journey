output "userAge" {
  value = "My name is ${var.username} and my age is ${lookup(var.usersAge , "${var.username}" )}"

}

# Pass in userName through Command Line = terraform plan -var="username=Devendra"

# Pass in userAge through Command Line = terraform plan -var="usersAge={ Dev = 20 }" -var="username=Dev"