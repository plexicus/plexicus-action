# COVULOR Plexalyzer Action

Official GitHub Action for COVULOR cloud service by Plexicus. Analyze your code directly in your Pull Requests.

## Quick Start

Add this workflow to your repository:

```yaml
name: COVULOR Analysis
on:
  pull_request:
    types: [opened, synchronize]

jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: COVULOR Analysis
        uses: plexicus/plexalyzer-action@v1
        with:
          covulor-token: ${{ secrets.COVULOR_TOKEN }}
          repo-id: 'your-repo-id-from-covulor'  # Get this from COVULOR dashboard
```

## Setup Instructions

1. Get your COVULOR token from [COVULOR Dashboard]
2. Get your repository ID from COVULOR dashboard
3. In your repository, go to Settings → Secrets and variables → Actions
4. Add a new repository secret called `COVULOR_TOKEN` with your token
5. Create `.github/workflows/covulor.yml` with the example above, replacing `your-repo-id-from-covulor` with your actual repository ID

## Required Inputs

| Input | Description |
|-------|-------------|
| `covulor-token` | Your COVULOR authentication token (should be kept secret) |
| `repo-id` | Your repository ID from COVULOR dashboard |

## Features

- Automatic PR analysis
- Direct integration with COVULOR cloud service
- Real-time results in your Pull Requests
- Secure token-based authentication

## Requirements

- Active COVULOR subscription
- Valid COVULOR authentication token
- Repository ID from COVULOR dashboard
- Repository with Pull Request events enabled

## Example Configuration

Here's a complete example with all required parameters:

```yaml
name: COVULOR Analysis
on:
  pull_request:
    types: [opened, synchronize]

jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: COVULOR Analysis
        uses: plexicus/plexalyzer-action@v1
        with:
          covulor-token: ${{ secrets.COVULOR_TOKEN }}
          repo-id: 'repo-123'  # Replace with your actual repo ID
```

## Support

For support and questions:
- COVULOR Documentation: [link]
- Plexicus Support: [email/link]
- GitHub Issues: Create an issue in this repository

## About Plexicus

Plexicus provides enterprise-grade code analysis through the COVULOR cloud service. Learn more at [website].
