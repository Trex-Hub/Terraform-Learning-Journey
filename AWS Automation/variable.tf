variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "ports" {
  type = list(number)

}

variable "instance_type" {
  type = string

}

variable "imgae_name" {
  type = string
}

variable "owners" {
  type = string
}

variable "root_device_type" {
  type = string
}

variable "virtualization_type" {
  type = string
}