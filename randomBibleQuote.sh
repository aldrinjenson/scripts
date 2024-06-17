#!/bin/sh
# Script to generate random quote from all over the bible
# Created on 16/8/21

book=$(kjv -l | shuf -n 1 | cut -d ' ' -f1)
kjv "$book" | shuf -n 1
