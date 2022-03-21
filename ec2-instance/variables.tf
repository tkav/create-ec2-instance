variable "region" {
  type        = string
  description = "The region to deploy in"
  default     = "ap-southeast-2"
}

variable "project_name" {
  type        = string
  description = "The name of the project that this app is apart of."
  default     = "test"
}

variable "key_name" {
  type        = string
  description = "SSH key for instances."
}

variable "ami" {
  type        = string
  default     = "ami-0646b10ec20a40c81"
  description = "Instance AMI to use"
}

variable "instance_size" {
  type        = string
  default     = "t3.micro"
  description = "Size of instance. eg. 't3.micro'."
}