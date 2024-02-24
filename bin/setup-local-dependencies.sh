#!/bin/bash

set -euxo pipefail

# Check if homebrew is installed
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check if docker is installed
# Otherwise install with brew --cask
if test ! $(which docker); then
    echo "Installing docker..."
    brew install --cask docker
fi

# Check if code is installed
# Download in zip from "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal" in /tmp
if test ! $(which code); then
    echo "Installing Visual Studio Code..."
    curl -o /tmp/vscode.zip -L "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal"
    unzip /tmp/vscode.zip -d /tmp
    mv "/tmp/Visual Studio Code.app" /Applications
fi