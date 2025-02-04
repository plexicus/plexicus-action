# Plexalyzer Action

Official GitHub Action for COVULOR cloud service by Plexicus. Analyze your code directly in your Pull Requests.

## Quick Start

Add this workflow to your repository:

```yaml
name: PLEXALYZER Analysis
on:
  pull_request:
    types: [opened, synchronize]

jobs:
  analyze:
    if: ${{ !startsWith(github.head_ref, 'Plexicus-AI-Remediation-') }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Get Changed Files and Save to File
        id: get_changed_files
        if: ${{ vars.COVULOR_REPO_ID }}
        shell: bash
        run: |
          # Capture changed files and save to a temporary file
          changed_files=$(git diff --name-only "${{ github.event.pull_request.base.sha }}" "${{ github.event.pull_request.head.sha }}")
          echo "$changed_files" | jq -R -s -c 'split("\n")[:-1]' > files_to_scan.json
          echo "files_path=$(pwd)/files_to_scan.json" >> $GITHUB_ENV

      - name: Set Empty Files Path if Not Set
        if: ${{ !vars.COVULOR_REPO_ID }}
        run: echo "files_path=" >> $GITHUB_ENV

      - name: Run PLEXALYZER Analysis
        uses: plexicus/plexicus-action@main
        with:
          plexalyzer-token: ${{ secrets.PLEXALYZER_TOKEN }}
          repo-id: ${{ vars.COVULOR_REPO_ID }}
          repo-name: ${{ github.repository }}
          branch: ${{ github.event.pull_request.base.ref }}
          url: ${{ github.event.repository.clone_url }}
          pr-id: ${{ github.event.pull_request.number }}
          files-path: ${{ env.files_path }}
          workspace-path: ${{ github.workspace }}

```

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
