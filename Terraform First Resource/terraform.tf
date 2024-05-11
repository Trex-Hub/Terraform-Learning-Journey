terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
    token = "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"
}

resource "github_repository" "first-repo-created" {
  name        = "first-repo-created-from-terraform"
  description = "Repo Creation Automation Via Terraform"
  visibility = "private"
  auto_init = true
}