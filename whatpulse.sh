#!/bin/bash

LD_LIBRARY_PATH=/usr/lib/openssl-1.0 QT_X11_NO_MITSHM=1 /usr/bin/whatpulse-bin "$@"

