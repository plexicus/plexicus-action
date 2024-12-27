# COVULOR Plexalyzer Action

Official GitHub Action for COVULOR cloud service by Plexicus. Analyze your code directly in your Pull Requests.

## Quick Start

Add this workflow to your repository:

[user_action](https://github.com/plexicus/plexicus-action/blob/main/user_action.yml)

## Setup Instructions

1. Generate your Plexalyzer token from the [COVULOR Connectors]
2. In your repository, go to Settings → Secrets and variables → Actions
3. Add a new repository secret called `PLEXALYZER_TOKEN` with your token
4. Get a repository ID by running the github action once and then accessing your COVULOR account in this URL: `https://covulor.plexicus.com/repositories`
5. Add a new repository variable called `COVULOR_REPO_ID` with your repository ID

## Required Inputs

| Input | Description |
|-------|-------------|
| `plexalyzer-token` | Your Plexalyzer authentication token (should be kept secret) |
| `repo-id` | Your repository ID from COVULOR dashboard |

## Features

- Automatic PR analysis
- Direct integration with COVULOR cloud service
- Real-time results in your Pull Requests
- Secure token-based authentication

## Requirements

- Active COVULOR subscription
- Valid Plexalyzer authentication token
- Repository ID from COVULOR dashboard
- Repository with Pull Request events enabled

## Support

For support and questions:
- COVULOR Documentation: https://www.plexicus.com
- Plexicus Support: engineering@plexicus.com
- GitHub Issues: Create an issue in this repository

## About Plexicus

Plexicus provides enterprise-grade code analysis through the COVULOR cloud service. Learn more at [[Plexicus](https://www.plexicus.com)].
