resource "github_repository" "first-repo-created" {
  name        = "first-repo-created-from-terraform"
  description = "Repo Creation Automation Via Terraform"
  visibility = "public"
  auto_init = true
}

// To revert/delete all the created resources use - terraform destory
// To revert/delete selected targeted Resources use -terraform destory -target [Label1].[Label2]
// eg - terraform destory -target github_repository.first-repo-created

// to Validate if Configuration is Valid  or Not we Can use - terraform validate

output "repo_url" {
  value = github_repository.first-repo-created.html_url
}

// Terraform Plan generates a Sample output which is not saved inside the tfstate file
// Terraform Apply generates the final output which is saved inside the tfstate file and can be accessed using commands
// Output Access Command - terraform output [output block name]
// eg. terraform output repo_url

