FROM cirrusci/flutter:3.3.7@sha256:51f5e38a9554a5949d024426f631277ea04ec7bf20290480baa8e18d3b411ea7

RUN sudo apt update && sudo apt install -y --no-install-recommends \
    cmake \
    ninja-build \
    clang \
    pkg-config \
    libgtk-3-dev \
    xvfb

COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["test", "integration_test"]
