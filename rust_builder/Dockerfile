ARG RUST_VERSION
ARG DEBIAN_SUITE
FROM rust:${RUST_VERSION}-${DEBIAN_SUITE}

RUN apt update && \
    apt install -y clang cmake protobuf-compiler libprotobuf-dev

ARG TOOLCHAIN_VERSION
ENV CARGO_TERM_COLOR=always
ENV RUSTFLAGS=-Dwarnings
ENV RUST_BACKTRACE=1

RUN rustup toolchain install ${TOOLCHAIN_VERSION} && \
    rustup default ${TOOLCHAIN_VERSION} && \
    cargo install cargo-chef sccache --locked
