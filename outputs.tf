/*
aws_instance.app_server é o nome definido no resource no arquivo main
*/

/* output "instance_id" {
  description = "ID da instancia EC2 criada"
  value       = module.ec2_instance.id
}

output "instance_public_ip" {
  description = "Endereço do IP Publico da instancia EC2"
  value       = module.ec2_instance.public_ip
} */
/* output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.website_s3_bucket.arn
}

output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value       = module.website_s3_bucket.name
}

output "website_bucket_domain" {
  description = "Domain name of the bucket"
  value       = module.website_s3_bucket.domain
} */

# EC2 Multiple
output "ec2_instance" {
  description = "The full output of the `ec2_module` module"
  value       = module.ec2_instance
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}
