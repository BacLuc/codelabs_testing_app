FROM cirrusci/flutter:3.3.6@sha256:ccebc16d30111de260fcc5ed526f0dece7b796fc7474740099212da409facc1c

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
