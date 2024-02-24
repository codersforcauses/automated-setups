FROM mcr.microsoft.com/devcontainers/base:bullseye

ARG USERNAME=vscode

# Used to persist bash history as per https://code.visualstudio.com/remote/advancedcontainers/persist-bash-history
# Based from https://github.com/jamiekt/devcontainer1/blob/2023-05/.devcontainer/Dockerfile
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && mkdir /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R $USERNAME /commandhistory \
    && echo "$SNIPPET" >> "/home/$USERNAME/.bashrc"

RUN apt-get update \
    && apt install -y bat figlet

# Setup the utility folder
RUN mkdir -p /opt/utils
COPY ./utils /opt/utils

# Add a display script for every terminal run
RUN echo "/opt/utils/startup_display.sh" >> "/home/${USERNAME}/.zshrc"