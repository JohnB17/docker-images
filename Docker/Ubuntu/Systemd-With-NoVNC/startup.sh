#!/bin/bash
/lib/systemd/systemd
/usr/bin/vncserver -depth 24 -geometry $RESOLUTION  :%i
novnc --listen 6900 --vnc localhost:5900
