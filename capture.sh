#!/bin/bash

PATH="/usr/local/bin:$PATH"

DATE=$(date +"%y%m%d_%H%M%S")
PIC_FILE=/home/pi/photolog/images/$DATE.jpg
VID_FILE=/home/pi/photolog/videos/$DATE.mp4

raspistill --annotate 1036 -w 1944 -h 2592 -rot 270 -o $PIC_FILE
ffmpeg -loop 1 -i $PIC_FILE -t 0.1 -pix_fmt yuv420p -y $VID_FILE

rm $PIC_FILE

# ffmpeg -f concat -safe 0 -i <(for f in ./videos/*.mp4; do echo "file '$PWD/$f'"; done) -c copy -y output.mp4
