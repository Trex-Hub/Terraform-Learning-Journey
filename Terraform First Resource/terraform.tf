terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {}

resource "github_repository" "first-repo-created-from-terraform" {
  name        = "first-repo-created-from-terraform"
  description = "Repo Creation Automation Via Terraform"
  visibility = "private"
  auto_init = true

  template {
    owner                = "github"
    repository           = "terraform-template-module"
    include_all_branches = true
  }
}