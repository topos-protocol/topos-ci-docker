FROM ghcr.io/helmfile/helmfile:v0.149.0 as helmfile
FROM hashicorp/terraform:1.3.6 as terraform
FROM debian:bullseye

COPY --from=terraform /bin/terraform /bin/terraform
COPY --from=helmfile /usr/local/bin/helmfile /bin/helmfile

RUN apt-get update && apt-get install -y \
    awscli \
    apt-transport-https \
    curl \
    git \
    gnupg \
    software-properties-common \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Install Helm
RUN curl -L https://git.io/get_helm.sh | bash -s -- --version v3.8.2
# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
