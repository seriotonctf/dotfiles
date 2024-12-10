#!/bin/bash

if ip a show tun0 > /dev/null 2>&1; then
  ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
else
  echo ""
fi
