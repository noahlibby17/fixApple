#!/bin/bash

# get params
USER='noahlibby'
now=$(date)
now_full=$(date +'%Y-%m-%d')
DIR="/Users/${USER}/Downloads/"

# watch the Downloads folder
#inotifywait -m -q -e create "$DIR" --format "%f" | while read f

fswatch --event Created "${DIR}" | xargs -n 1 | (while read f
do
    #echo $f
    # check if the file is a .HEIC file
    if [[ $f = *.HEIC ]] || [[ $f = *.HEIF ]]; then
      # if so, change the file extension to .JPEG
      BASE=${f%.*}
      #ext=${f#*.}
      mv $f "${BASE}.JPEG"
    fi
done
)
