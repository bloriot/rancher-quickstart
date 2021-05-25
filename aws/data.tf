# Data for AWS module

# AWS data
# ----------------------------------------------------------

# Use latest SLES 15 SP2 AMI
data "aws_ami" "sles" {
  most_recent = true
  owners = ["013907871322"] # Amazon

  filter {
    name   = "name"
    values = ["suse-sles-15-sp2-*-hvm-ssd-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
