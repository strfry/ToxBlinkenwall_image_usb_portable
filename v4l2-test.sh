#!/bin/sh -e

apt install -y v4l2loopback-dkms v4l2loopback-utils gstreamer1.0-plugins-good

modprobe -r v4l2loopback
modprobe v4l2loopback

v4l2-ctl -d /dev/video0 -c timeout=3000

v4l2loopback-ctl set-fps 25 /dev/video0

v4l2loopback-ctl set-caps "video/x-raw,format=UYVY,width=640,height=480" /dev/video0

v4l2loopback-ctl set-timeout-image testcard.png  /dev/video0

# We need to wait here, until the software has started to grab the webcam.
(sleep 60; gst-launch-1.0 -v videotestsrc pattern=snow ! "video/x-raw,width=640,height=480,framerate=25/1,format=UYVY" ! v4l2sink device=/dev/video0 ) &


