variable "tfe_task_org" {
  description = "The name or the organization."
}

variable "tfe_task_email" {
  description = "Email for the organization"
}

variable "project_name" {
  default = "TFE-Project"
}

variable "oauth_github" {
  description = "The OAuth token for GitHub."
}

variable "vsc_workspace_name" {
  default = "aws-gh-repo-foreach"
}

variable "github_username" {
  description = "The GH account where the repository is located."
}

variable "tfe_cli_var_set_name" {
  default = "CLI Variable Set"
}