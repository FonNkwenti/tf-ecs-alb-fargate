variable "region" {
  type    = string
  default = "us-east-1"
}
variable "account_id" {
  type    = number
  default = 123456789012
}

variable "tag_environment" {
  type    = string
  default = "dev"
}

variable "tag_project" {
  type    = string
  default = "my-tf-project"
}

variable "container_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 3000

}