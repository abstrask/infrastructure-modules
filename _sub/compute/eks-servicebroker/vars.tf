#Initializes the variables needed to generate a new account
#The values vill be propagated via a tfvars file
variable "table_name" {}

variable "aws_region" {}

variable "workload_account_id" {}

variable "worker_role_id" {}