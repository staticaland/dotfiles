#!/bin/bash

SSID="$1"
PASSWORD="$(pass "$SSID")"
QR_CONTENT="WIFI:S:$SSID;T:WPA;P:$PASSWORD;;"

qrencode "$QR_CONTENT" -t UTF8
