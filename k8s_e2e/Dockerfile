FROM ghcr.io/helmfile/helmfile:v0.149.0 as helmfile
FROM hashicorp/terraform:1.3.6 as terraform
FROM debian:bullseye

COPY --from=terraform /bin/terraform /bin/terraform
COPY --from=helmfile /usr/local/bin/helmfile /bin/helmfile

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    curl \
    git \
    jq \
    gnupg \
    software-properties-common \
    unzip \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://git.io/get_helm.sh | bash -s -- --version v3.8.2
RUN curl -LO "https://dl.k8s.io/release/v1.26.0/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install
