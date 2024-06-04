# Automated Setup

This is the repository that contains the automated development environment setup for Coders For Causes project including some of the base images.

## CFC-Devenv

CFC-Devenv, also known as "Coders for Causes - Developer Environment" is the automated development environment setup for Coders For Causes developer machine.

With only having 2 prerequisite:

- Vscode
- Docker

We are able to automate the setup of tooling. By default these are what we install:

- Git
- Github CLI
- Node (npm, yarn, nvm, pnpm, typescript)
- Python (black, poetry)
- Sane Vscode extensions
- Vscode CLI + Server
- Zsh Plugins

### Using this

To use this, do the following:

1. Ensure the `.devcontainer/devcontainer.json` is in your project
2. On the bottom left of your vscode, click the green button that has an icon that looks like this "><"
3. Select "Reopen in Container".

or just open the command palette and type "Reopen in Container".

### Setups

There's a folder called `cfc-devenv-base` that defines the base image for development environment. We prebuild this image in the CI (github actions), the reason why we do this is so that the developer environment just gets downloaded rather than built in the developer machine.

There's a folder called `.devcontainer` that defines the development environment setup. You will want to copy this folder into your project which allows developers to pull the development environment setup from the base image. Notice that the image it references is `cfc-devenv-base` which is the prebuilt image.

### The reason why we do this

In a CFC project, you will have roughly around 50 developers machine to setup. There will be a lot of inconsistency in the environment such as the 3 operating systems we support (Windows, Mac, Linux). By automating the setup, we are able to ensure that the environment is consistent across all developers, but not only that, we are able to provide a taste of the an amazing tooling for beginner developers.

Less setup = Less pain = More time to make features = More impact = Happy developers

#### What makes this different from running docker containers locally?

Devcontainer is a way to automate tooling setup including vscode extensions, zsh plugins. You may still need to run docker containers locally, such as running a local database. It is even recommended to use still setup your backend in Docker because you will reuse that in production environments/

#### Registry-based Caching

I didn't realise that devcontainer to build for arm64 and amd64 takes like 40 minutes. So I had to implement registry-based caching by downloading the layers first in the registry before building. Read more here https://docs.docker.com/build/ci/github-actions/cache/#registry-cache if you want to learn about it.

tldr; I just referenced the cache in the `.devcontainer` folder so it downloads it before building.
