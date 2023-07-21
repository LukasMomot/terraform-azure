# variable "applications" {
#   description = "List of applications"
#   type        = list(string)
#   default     = ["angular-ghactions", "angular-pipelines"]
# }

variable "environments" {
  description = "Environment to be used"
  type        = list(string)
  default     = ["dev", "uat", "prod"]
}

# variable "iterations" {
#   default     = [1, 2, 3, 4]
#   description = "Iteration numbers"
# }