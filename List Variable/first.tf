output "printFirst" {
#   value = "First User of the List is ${var.users[1]}"
    value = " ${ join(" and " , var.users) }" 
}

# Input  = [ "Devendra" , "ByteBard" , "TreX" ] 
# terraform plan -var 'users=[ "Devendra" , "ByteBard" , "TreX" ]' 


output "wordUppper" {
    value = "${upper(var.users[0])}"
}
output "wordLower" {
    value = "${lower(var.users[0])}"
}
output "wordTitle" {
    value = "${title(var.users[0])}"
}