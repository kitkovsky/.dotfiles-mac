#!/bin/zsh

if [ -z "$1" ]
then
    echo "no link provided"
    exit 1
fi

if ! command -v youtube-dl &> /dev/null
then
    echo "youtube-dl could not be found"
    exit 1
fi

if [ ! -d ~/.dotfiles/venv ]
then
    echo "venv not found"
    exit 1
fi

youtube-dl --extract-audio --audio-format wav --audio-quality 0 -o "song.%(ext)s" $1
echo "Downloaded and extracted audio from youtube"

source ~/.dotfiles/venv/bin/activate
demucs --two-stems=vocals song.wav
deactivate

mv ./separated/mdx_extra_q/song/*.wav ./
rm -rf separated
