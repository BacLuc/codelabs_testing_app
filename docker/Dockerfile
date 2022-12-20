FROM cirrusci/flutter:3.3.10@sha256:6252a6c1f7f24a5d74114630190dceaf419c476d9ca177c4d91ef916628d9e7f

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
