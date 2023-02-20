ARG RUST_VERSION
ARG DEBIAN_SUITE
FROM rust:${RUST_VERSION}-${DEBIAN_SUITE}

RUN apt update && \
    apt install -y clang cmake protobuf-compiler libprotobuf-dev

ARG TOOLCHAIN_VERSION
ENV CARGO_TERM_COLOR=always
ENV RUSTFLAGS=-Dwarnings
ENV RUST_BACKTRACE=1

ENV SCCACHE_S3_KEY_PREFIX=rust-builder-${BUILDPLATFORM}
ENV SCCACHE_BUCKET=cicd-devnet-1-sccache
ENV SCCACHE_REGION=us-east-1
ENV RUSTC_WRAPPER=/usr/local/cargo/bin/sccache

RUN --mount=type=secret,id=aws,target=/root/.aws/credentials \
    rustup toolchain install ${TOOLCHAIN_VERSION} && \
    rustup default ${TOOLCHAIN_VERSION} && \
    cargo install cargo-chef sccache --locked
