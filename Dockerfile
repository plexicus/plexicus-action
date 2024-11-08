FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    docker-cli \
    jq \
    bash

# Set entrypoint
ENTRYPOINT ["/app/run_plexalyzer.sh"]
