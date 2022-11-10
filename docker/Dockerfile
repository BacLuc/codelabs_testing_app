FROM cirrusci/flutter:3.3.8@sha256:1de5b249423f5961ba75c7c3d60a4aac2290276c0c7ce5bcd2dcc2e8941508ec

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
