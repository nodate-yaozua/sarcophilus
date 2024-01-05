#!/bin/bash

service dbus start

#service bluetooth start
bluetoothd -E &

pulseaudio --exit-idle-time=-1 &
until pactl info > /dev/null 2>&1; do
    echo "Waiting for PulseAudio start"
    sleep 1
done

# pactl load-module module-bluetooth-policy
# pactl load-module module-bluetooth-discover
pactl load-module module-alsa-sink device=${SINK_DEVICE}

if [ "$1" == "--default" ]; then
    while true; do sleep 1000; done
else
    exec "$@"
fi