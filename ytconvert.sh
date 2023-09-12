#!/bin/bash

cd $HOME/ytconvert
yt-dlp -f 140 "$1"
yt-dlp -f 137 "$1"
yt-dlp -f 299 "$1"
ffmpeg -i *.mp4 -i *.m4a -c:v copy -c:a copy "$2".mp4
mv "$2".mp4 $HOME/yt
rm -f $HOME/ytconvert/*
