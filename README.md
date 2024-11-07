# COVULOR Plexalyzer Action

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
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: PLEXALYZER Analysis
        uses: plexicus/plexalyzer-action@v1
        with:
          plexalyzer-token: ${{ secrets.PLEXALYZER_TOKEN }}
          repo-id: 'your-repo-id-from-covulor'  # Get this from COVULOR dashboard
```

## Setup Instructions

1. Generate your Plexalyzer token from the [COVULOR Connectors]
2. Get your repository ID from COVULOR API using the following curl command:
```
export PLEXALYZER_TOKEN=XXXXXXXXXXXXXXXX
curl -L 'https://api.covulor.dev.plexicus.com/receive_plexalyzer_message' \
-H 'Authorization: Bearer $PLEXALYZER_TOKEN' \
-H 'Content-Type: application/json' \
-d '{
    "request": "create-repo",
    "extra_data": {
        "repository_name": $YOUR_REPO_NAME
    }
}'
```

This will return a response like this:

```
{
    "data": {
        "auto_validation": true,
        "repository_id": "6728a75a9eceb24cf4937b0d"
    },
    "message": "Success creating the repository",
    "status_code": 200
}
```
3. In your repository, go to Settings → Secrets and variables → Actions
4. Add a new repository secret called `PLEXALYZER_TOKEN` with your token
5. Create `.github/workflows/covulor.yml` with the example above, replacing `your-repo-id-from-covulor` with your actual repository ID

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

## Example Configuration

Here's a complete example with all required parameters:

```yaml
name: PLEXALYZER Analysis
on:
  pull_request:
    types: [opened, synchronize]

jobs:
  analyze:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: PLEXALYZER Analysis
        uses: plexicus/plexalyzer-action@v1
        with:
          plexalyzer-token: ${{ secrets.PLEXALYZER_TOKEN }}
          repo-id: 'repo-123'  # Replace with your actual repo ID
```

## Support

For support and questions:
- COVULOR Documentation: https://www.plexicus.com
- Plexicus Support: engineering@plexicus.com
- GitHub Issues: Create an issue in this repository

## About Plexicus

Plexicus provides enterprise-grade code analysis through the COVULOR cloud service. Learn more at [[Plexicus](https://www.plexicus.com)].
