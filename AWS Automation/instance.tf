# Creating EC2 Instance
resource "aws_instance" "First-TF-Instance" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "First-TF-Instance"
  }
  user_data = file("${path.module}/script.sh")

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "Readme.MD"
    destination = "/tmp/Readme.MD"
  }
  provisioner "file" {
    content     = "This is test content"
    destination = "/tmp/Content.MD"
  }
  provisioner "file" {
    source     = "test-folder"
    destination = "/tmp/test-folder/"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ip_address.txt " 
  }
  provisioner "local-exec" {
    interpreter = [ 
      "/usr/bin/python3", "-c"
     ]
     command = "print('Hello World')"
  }

}
