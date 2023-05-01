resource "aws_instance" "bastion" {
  depends_on = [
    aws_security_group.bastion_sg,
    # SigmaVpcPublicSubnet1a,

  ]
  ami                    = data.aws_ami.ubuntu_20_04.id
  instance_type          = var.bastion_instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  subnet_id              = aws_subnet.sigma-eks-db-subnet-a.id
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-bastion-host", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
}

resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
  vpc      = true
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-bastion-host-eip", var.common_tags["AssetID"], var.common_tags["Environment"], var.common_tags["Project"])
    },
  )
}

resource "null_resource" "copy_ec2_keys" {
  depends_on = [aws_instance.bastion]
  connection {
    type        = "ssh"
    host        = aws_eip.bastion_eip.public_ip
    user        = "ubuntu"
    password    = ""
    private_key = file("./private-key/terraform-key1.pem")
  }

  # provisioner "file" {
  #   source      = "./bastion-user-data/bastion-host-user-data.sh"
  #   destination = "/tmp/bastion-host-user-data.sh"
  # }

  # provisioner "file" {
  #   source      = "./private-key/terraform-key1.pem"
  #   destination = "/tmp/terraform-key.pem"
  # }
}