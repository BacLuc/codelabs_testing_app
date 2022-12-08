FROM cirrusci/flutter:3.3.9@sha256:00ea53fb9c4ce3de54fa425b68b473921732f80148a3e2a20fea18d106e3b5a6

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
