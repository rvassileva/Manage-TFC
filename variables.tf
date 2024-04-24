variable "tfe_task_org" {
  description = "The name or the organization."
}

variable "tfe_task_email" {
  description = " Admin email address."
}

variable "gh_personal_token" {
  description = "The token string you were given by your VCS provider, e.g. ghp_xxxxxxxxxxxxxxx for a GitHub personal access token"
}

variable "project_name" {
  default = "TFE-Project"
}

variable "vsc_workspace_name" {
  default = "aws-gh-repo-foreach"
}

variable "tfe_cli_var_set_name" {
  default = "CLI Variable Set"
}

variable "oauth_gh_name" {
  default = "tfe-task-github-oauth-client"
}