ARG DEBIAN_SUITE
FROM rust:${DEBIAN_SUITE}

RUN apt update && \
    apt install -y clang cmake

ARG TOOLCHAIN_VERSION

ARG PROTOC_VERSION=22.2

ENV CARGO_NET_GIT_FETCH_WITH_CLI=true
ENV CARGO_TERM_COLOR=always
ENV RUSTFLAGS=-Dwarnings
ENV RUST_BACKTRACE=1

RUN ARCHITECTURE=$(uname -m | sed -e "s/arm64/arm_64/g" | sed -e "s/aarch64/aarch_64/g") \
    && curl -LOs "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-$ARCHITECTURE.zip" \
    && unzip -o "protoc-${PROTOC_VERSION}-linux-$ARCHITECTURE.zip" -d /usr/local bin/protoc \
    && unzip -o "protoc-${PROTOC_VERSION}-linux-$ARCHITECTURE.zip" -d /usr/local 'include/*' \
    && chmod +x "/usr/local/bin/protoc" \
    && rm "protoc-${PROTOC_VERSION}-linux-$ARCHITECTURE.zip"

RUN rustup toolchain install ${TOOLCHAIN_VERSION} && \
    rustup default ${TOOLCHAIN_VERSION} && \
    cargo install sccache --locked
