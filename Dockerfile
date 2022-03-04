# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.195.0/containers/rust/.devcontainer/base.Dockerfile
# [Choice] Debian OS version (use bullseye on local arm64/Apple Silicon): buster, bullseye
ARG VARIANT="latest"
FROM mcr.microsoft.com/vscode/devcontainers/rust:${VARIANT}

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends cmake pkg-config libssl-dev clang

RUN rustup toolchain install nightly && \
    rustup target add wasm32-unknown-unknown --toolchain nightly && \
    rustup default nightly

RUN install -d bin
COPY entrypoint.sh /entrypoint.sh
COPY init.sh /init.sh
COPY git_env_password.sh bin/git_env_password.sh
ENTRYPOINT ["/entrypoint.sh"]