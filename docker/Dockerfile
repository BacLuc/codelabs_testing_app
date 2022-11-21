FROM cirrusci/flutter:3.3.8@sha256:16c9d3b4bf8926f8c7c444e523e746948d4a6bb85fe0f9ace9ab8833cd9f15ed

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
