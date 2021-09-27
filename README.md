# Photolog

Script that creates fast-motion videos using crontab & ffmpeg

## Usage
Create crontab task (this runs on the RPi)
```
# every 8 minutes from 7am til 12pm (exclusive) -- for testing
*/8 7-23 * * * /home/pi/photolog/capture.sh >/home/pi/photolog/capture.log 2>&1
```

Concatenate captures to create the fast-motion mp4 (this can be executed on the RPi or any other machine but you gotta transfer `videos/`)
```
ffmpeg -f concat -safe 0 -i <(for f in ./videos/*.mp4; do echo "file '$PWD/$f'"; done) -c copy output.mp4
```


