# # Creating SSH Key
# resource "aws_key_pair" "key-tf" {
#   key_name   = "key-tf"
#   public_key = file("${path.module}/id_rsa.pub")
# }

# output "keyName" {
#   value = aws_key_pair.key-tf.key_name
# }

# Creating Security Group

resource "aws_security_group" "allow_tls" {
  name        = "First-TF-SG"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


}



# resource "aws_instance" "First-TF-Instance" {
#   ami           = "ami-0cc9838aa7ab1dce7"
#   instance_type = "t2.micro"
#   key_name      = aws_key_pair.key-tf.key_name
#   tags = {
#     Name = "First-TF-Instance"
#   }
# }

