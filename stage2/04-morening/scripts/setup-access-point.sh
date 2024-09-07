#!/bin/bash
set -e

AP_CONN_NAME='morening'
AP_SSID='morening'
AP_PASSWORD='12345678'

sudo nmcli con add type wifi ifname wlan0 con-name "$AP_CONN_NAME" autoconnect no ssid "$AP_SSID"
sudo nmcli con modify "$AP_SSID" 802-11-wireless.mode ap 802-11-wireless.band bg ipv4.method shared
sudo nmcli con modify "$AP_SSID" wifi-sec.key-mgmt wpa-psk
sudo nmcli con modify "$AP_SSID" wifi-sec.psk "$AP_PASSWORD"