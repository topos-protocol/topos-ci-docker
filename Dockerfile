FROM rust:1.51.0

LABEL "com.github.actions.name"="Rust Action"
LABEL "com.github.actions.description"="'Silverbullet' for a quickstart Rust CI based upon Github Actions"
LABEL "com.github.actions.icon"="play-circle"
LABEL "com.github.actions.color"="gray-dark"

RUN rustup component add clippy-preview
RUN rustup component add rustfmt-preview

RUN cargo install cargo-release
RUN cargo install cargo-tarpaulin
RUN rustup toolchain install nightly
RUN rustup target add wasm32-unknown-unknown --toolchain nightly

RUN apt-get update && apt-get install -y \
    cmake pkg-config libssl-dev git build-essential clang libclang-dev curl \
&& rm -rf /var/lib/apt/lists/*

RUN install -d /github/home/.cargo
RUN install -d bin
COPY cargo/config /github/home/.cargo/config
COPY gitconfig /github/home/.gitconfig
COPY entrypoint.sh /entrypoint.sh
COPY git_env_password.sh bin/git_env_password.sh
ENTRYPOINT ["/entrypoint.sh"]
