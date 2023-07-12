variable "applications" {
  description = "List of applications"
  type = list(string)
  default = [ "angular-ghactions", "angular-pipelines" ]
}

variable "environment" {
  description = "Environment to be used"
  default = "dev"
}

variable "iterations" {
  default = [1,2,3,4]
  description = "Iteration numbers"
}