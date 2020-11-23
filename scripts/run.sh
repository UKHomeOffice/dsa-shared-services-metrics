#!/bin/sh
set -x

python3 expose-port.py &
python3 monitoring-script.py
