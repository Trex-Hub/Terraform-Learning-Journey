# Creating SSH Key
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

output "keyName" {
  value = aws_key_pair.key-tf.key_name
}

resource "aws_instance" "First-TF-Instance" {
  ami           = "ami-0cc9838aa7ab1dce7"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.key-tf.key_name
  tags = {
    Name = "First-TF-Instance"
  }
}

