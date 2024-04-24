terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.53.0"
    }
  }
}

# Create an organization
resource "tfe_organization" "tfe_task_org" {
  name  = var.tfe_task_org
  email = var.tfe_task_email
}

# Create a project in the organization
resource "tfe_project" "tfe_task_project" {
  name         = var.project_name
  organization = tfe_organization.tfe_task_org.name
}

# Create an Oauth client which represents the connection between an organization and a VCS provider.
resource "tfe_oauth_client" "tfe_oauth_github" {
  name             = var.oauth_gh_name
  organization     = tfe_organization.tfe_task_org.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.gh_personal_token
  service_provider = "github"
}

# Create a workspace with VCS-driven workflow
resource "tfe_workspace" "tfe_vcs_foreach" {
  name           = var.vsc_workspace_name
  organization   = tfe_organization.tfe_task_org.name
  queue_all_runs = false
  project_id     = tfe_project.tfe_task_project.id
  vcs_repo {
    branch         = "main"
    identifier     = "rvassileva/gh-repo-foreach-10"
    oauth_token_id = tfe_oauth_client.tfe_oauth_github.oauth_token_id
  }
}

# Create 3 workspaces with CLI-driven workflow 
resource "tfe_workspace" "tfe_cli_workspaces" {
  count        = length(local.tfe_cli_workspaces)
  name         = local.tfe_cli_workspaces[count.index]
  organization = tfe_organization.tfe_task_org.name
  project_id   = tfe_project.tfe_task_project.id
}

# Create variable set for the CLI workspaces
resource "tfe_variable_set" "tfe_cli_var_set" {
  name         = var.tfe_cli_var_set_name
  description  = "Variable set for the CLI workspaces."
  organization = tfe_organization.tfe_task_org.name
}

# Attach the variable set to the CLI workspaces

# resource "tfe_workspace_variable_set" "cli_ws_var_set_a" {
#   workspace_id    = tfe_workspace.tfe_cli_workspaces[0].id
#   variable_set_id = tfe_variable_set.tfe_cli_var_set.id
# }

# resource "tfe_workspace_variable_set" "cli_ws_var_set_b" {
#   workspace_id    = tfe_workspace.tfe_cli_workspaces[1].id
#   variable_set_id = tfe_variable_set.tfe_cli_var_set.id
# }

# resource "tfe_workspace_variable_set" "cli_ws_var_set_c" {
#   workspace_id    = tfe_workspace.tfe_cli_workspaces[2].id
#   variable_set_id = tfe_variable_set.tfe_cli_var_set.id
# }

resource "tfe_workspace_variable_set" "cli_ws_var_set" {
  for_each        = local.workspace_ids
  workspace_id    = each.value
  variable_set_id = tfe_variable_set.tfe_cli_var_set.id
}

# Create a variable set containing: a terraform variable and an environment variable 
resource "tfe_variable" "var_terraform" {
  key             = "provider"
  value           = "tfe"
  category        = "terraform"
  description     = "This is the terraform variable"
  variable_set_id = tfe_variable_set.tfe_cli_var_set.id
}

resource "tfe_variable" "env_var" {
  key             = "org_id"
  value           = "org-xxxxxxxxxxxxxxxx"
  category        = "env"
  description     = "This is the environment variable"
  variable_set_id = tfe_variable_set.tfe_cli_var_set.id
}