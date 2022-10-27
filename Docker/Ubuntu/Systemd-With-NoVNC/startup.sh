#!/bin/bash
/lib/systemd/systemd
/usr/bin/vncserver -depth 24 -geometry $RESOLUTION  :%i
/var/novnc/utils/novnc_proxy --vnc localhost:5900 --listen 6900
