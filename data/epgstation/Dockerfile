ARG FFMPEG_VERSION=4.1
FROM jrottenberg/ffmpeg:${FFMPEG_VERSION}-ubuntu AS ffmpeg

FROM l3tnun/epgstation:master-debian
EXPOSE 8888

# ?
ENV LD_LIBRARY_PATH=/usr/local/lib
COPY --from=ffmpeg /usr/local /usr/local/

# todo
RUN apt update && \
    apt -y install yasm libx264-dev libmp3lame-dev libopus-dev libvpx-dev && \
    apt -y install libx265-dev libnuma-dev && \
    apt -y install libasound2 libass9 libvdpau1 libva-x11-2 libva-drm2 libxcb-shm0 libxcb-xfixes0 libxcb-shape0 libvorbisenc2 libtheora0 && \
    apt -y install libgomp1 libssl-dev


WORKDIR /app
ENTRYPOINT ["npm"]
CMD ["start"]
