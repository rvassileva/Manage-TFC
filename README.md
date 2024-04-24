# Manage-TFC

## 1. The Task Requirements

- Register a HCP Terraform/Terarform Cloud account
- Create a FREE tier HCP Terraform/Terraform Cloud organization.
- Review the tfe_provider documentation
- Use the tfe_provider and write a Terraform code creating the following resources in your organization:
- Create a project
- Create a workspace with VCS-driven workflow
- Create 3 workspaces with CLI-driven workflow
- Assign these workspaces to the same project
- Create a variable set containing: a terraform variable and an environment variable (variables key, value is up to you) 
- Make sure the variable set has been applied to all CLI workspaces
- Create VCS repo called: "Manage-TFC"
- "Manage-TFC" repo should contain a "README.md" file with detailed instructions on what a user/interviewer needs to do to run terraform init/plan/apply using your code on their own HCP Terraform/Terraform Cloud organization.
- Keep in mind that the user/interviewer needs to execute this code with minimal effort. (consider the use of variables)
- Give the interviewer access to this VCS repo to review your work

## 2. Content

This repo contents the following files:

- **README.md** file with information about the code and instructions for its execution
- **main.tf** - Contains provider configuration and all resources 
- **variables.tf** - The variables used in the code with their description or default values
- **locals.tf** - Local values used to make the code more dynamic as 'for' expressions are used
- **terraform.tfvars** - More sensitive variables with empty values which require your input

## 3. Prerequisites

1. Terraform Cloud/HCP account
2. GitHub account
3. [GitHub personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)


## 4. Steps to execute the code

Once you clone this repository on your machine, please proceed with the following steps:

1. Authenticate to Terraform Cloud using "terraform login" command.
2. Add values to the empty variables in terraform.tfvars file as it follows:

- **tfe_task_email** - admin email / your email address that you use for your Terraform Cloud/HCP account
- **tfe_task_org** - the name of your new organization
- **gh_personal_token** - your github personal access token

*Note: If you miss to fill the values in the terraform.tfvars file, terraform will ask for them on the next 'terraform plan/apply'.*

3. Execute the commands in the following order:

- Initialize Terraform: 

`terraform init`

- Review the plan:

`terraform plan`

- Apply the changes:

`terraform apply`

5. Once applied, verify in the TFC UI if all resources are created.

6. Enjoy! :) 