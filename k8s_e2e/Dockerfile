FROM hashicorp/terraform:1.3.6 as terraform
FROM debian:bullseye

COPY --from=terraform /bin/terraform /bin/terraform

RUN apt-get update && apt-get install -y \
    awscli \
    apt-transport-https \
    curl \
    gnupg \
    software-properties-common \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list \
    && apt-get update \
    && apt-get install helm

