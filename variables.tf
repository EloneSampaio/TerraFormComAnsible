variable "aws_region" {
  type        = string
  description = "Região onde vão estar as máquinas"
  default     = "us-west-2"
}
variable "profile" {
  type        = string
  description = "nome do profile da aws"
  default     = "default"
}

variable "instance_name" {
  type        = string
  description = "Nome da instancia/Máquina"
  default     = "LuaiBase"
}

variable "aws_ami" {
  type        = string
  description = "imagem do linux a ser utilizada"
  default     = "ami-08d70e59c07c61a3a"
}

variable "aws_tipo_maquina" {
  type        = string
  description = "Tipo de máquina a ser utilizada"
  default     = "t2.micro"
}

variable "aws_security_group" {
  type        = string
  description = "Security group para aws"
  default     = "luaibase-group"
}

variable "aws_vpc_name" {
  type        = string
  description = "VPC  para aws"
  default     = "luaibase-vpc"
}

/* variable "aws_bucket_name" {
  type        = string
  description = "Nome do bucket do S3 na aws"
  default     = "bucket-backend-s3"
}

variable "aws_bucket_tag" {
  type        = string
  description = "Tag do bucket do S3 na aws"
  default     = "backend-S3"
} */
variable "public_key" {
  default = "~/.ssh/MyKeyPair.pub"
}

variable "private_key" {
  default = "~/.ssh/MyKeyPair.pem"
}

variable "ansible_user" {
  type        = string
  description = "user do sistema"
  default     = "root"
} 

/* variable "amis" {
  type = "map"

  default = {
    ap-northeast-1 = "ami-b25d44b3" # Asia Pacific (Tokyo)
    ap-southeast-1 = "ami-aeb49ffc" # Asia Pacific (Singapore)
    ap-southeast-2 = "ami-6b770351" # Asia Pacific (Sydney)
  }
} */