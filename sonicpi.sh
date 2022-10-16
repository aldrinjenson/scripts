#!/bin/bash
# Script to start jackd and then allow sonic pi server to start successfully in arch linux
# Created on 2/10/22 after a long time of waiting!

jackd -R -d alsa -d hw:0 &
sonic-pi
