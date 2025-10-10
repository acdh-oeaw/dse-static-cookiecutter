FROM python:3.12-bookworm AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
        openjdk-17-jdk-headless \
        ant \
        git \
        curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN ./fetch_data.sh && ant

FROM nginx AS runtime

COPY --from=builder --chown=nginx:nginx /app/html /usr/share/nginx/html
