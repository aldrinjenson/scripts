#!/bin/bash

notify-send "Place your finger on the fingerprint scanner"
if fprintd-verify ; then
    echo "Fingerprint verification successful"
    playrandomsong.sh
else
    echo "Fingerprint verification failed"
fi

