FROM ghcr.io/astral-sh/uv:python3.13-bookworm-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
        openjdk-17-jdk-headless \
        ant \
        git \
        curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN {% if cookiecutter.use_remote_data %}./shellscripts/fetch_data.sh && {% endif %}ant

FROM nginx AS runtime

COPY --from=builder --chown=nginx:nginx /app/html /usr/share/nginx/html
