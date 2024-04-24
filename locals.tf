locals {
  tfe_cli_workspaces = ["cli_workspace_a", "cli_workspace_b", "cli_workspace_c"]
}

locals {
  workspace_ids = { for workspace in tfe_workspace.tfe_cli_workspaces : workspace.name => workspace.id }
}