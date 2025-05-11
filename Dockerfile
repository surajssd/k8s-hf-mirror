FROM python:3.13

# Find the latest release at
# https://github.com/vtuber-plan/olah/releases
ENV OLAH_VERSION="v0.4.1"

WORKDIR /olah

RUN git clone --branch ${OLAH_VERSION} https://github.com/vtuber-plan/olah /olah && \
    pip install --upgrade pip && \
    pip install -e . && \
    pip install brotli && \
    rm -rf /root/.cache

CMD ["olah-cli"]
