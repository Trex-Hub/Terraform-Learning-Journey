variable "users" {
    type = list(string)
}

output "printFirst" {
  value = "First User of the List is ${var.users[2]}"
}

# Input  = [ "Devendra" , "ByteBard" , "TreX" ] 