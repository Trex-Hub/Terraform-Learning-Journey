# Terraform only ask's for input of a variable when Default is not Defined.
variable "username" {
    type = string
    default = "Guest"
}

variable "age" {
    type = number
}