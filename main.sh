#!/bin/bash

# this script works with amixer commands

# path of python script for transcription 
stt='speech_to_text.py'

# check if microphone is active (mic=1)
# if microphone is not active (mic=0)
mic=0

# get settings about amixer 'Capture' (microphone), this name could change 
res=$(amixer -c 0 get 'Capture' | grep -o -m 1 '\[on\]')

# if the microphone is [off] will be turn on
if [[ $res == '[on]' ]];
then
    mic=1
else
    amixer -c 0 set 'Capture' cap
fi

# python script for transcription
python3 $stt

# if the microphone was off after the transcription script it turn off again
if [[ $mic -eq 0 ]];
then
    amixer -c 0 set 'Capture' nocap
fi

exit 0