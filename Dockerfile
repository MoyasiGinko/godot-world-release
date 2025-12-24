FROM ubuntu:22.04

# Install required system packages
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    ca-certificates \
    libstdc++6 \
    libgcc-s1 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Download Tinybox Linux build from GitHub Releases
RUN wget https://github.com/caelan-douglas/tinybox/releases/download/beta-13.1/Tinybox-b13.1-linux.zip \
    && unzip Tinybox-b13.1-linux.zip \
    && chmod +x Tinybox-linux/Tinybox.x86_64 \
    && rm Tinybox-b13.1-linux.zip

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run Tinybox headless
CMD ["/start.sh"]
