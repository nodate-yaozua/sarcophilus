FROM debian:bookworm AS base
RUN apt update && \
    apt upgrade -y && \
    apt install -y alsa-utils pulseaudio pulseaudio-module-bluetooth bluez

COPY entrypoint.sh .
ENTRYPOINT ["./entrypoint.sh"]
CMD ["--default"]