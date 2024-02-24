FROM mcr.microsoft.com/devcontainers/base:bullseye

RUN apt-get update \
    && apt install -y bat figlet

# Setup the utility folder
RUN mkdir -p /workspace/utils
COPY ./utils /workspace/utils

# Add a display script for every terminal run
RUN echo "/workspace/utils/startup_display.sh" >> ~/.zshrc