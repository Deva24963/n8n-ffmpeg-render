FROM n8nio/n8n:latest

USER root

RUN if command -v apk > /dev/null; then \
      apk add --no-cache ffmpeg; \
    elif command -v apt-get > /dev/null; then \
      apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*; \
    else \
      echo "No supported package manager found" && exit 1; \
    fi

USER node
