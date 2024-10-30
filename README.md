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
```

## Setup Instructions

1. Get your COVULOR token from [COVULOR Dashboard]
2. In your repository, go to Settings → Secrets and variables → Actions
3. Add a new repository secret called `COVULOR_TOKEN` with your token
4. Create `.github/workflows/covulor.yml` with the example above

## Features

- Automatic PR analysis
- Direct integration with COVULOR cloud service
- Real-time results in your Pull Requests
- Secure token-based authentication

## Requirements

- Active COVULOR subscription
- Valid COVULOR authentication token
- Repository with Pull Request events enabled

## Support

For support and questions:
- COVULOR Documentation: https://www.plexicus.com
- Plexicus Support: engineering@plexicus.com
- GitHub Issues: Create an issue in this repository

## About Plexicus

Plexicus provides enterprise-grade code analysis through the COVULOR cloud service. Learn more at [[Plexicus](https://www.plexicus.com)].
