#!/bin/bash

stt='/home/emanuele/Varie/OpenSource/Speech-to-Text-Keyboard/speech_to_text.py'

# check if microphone is active (mic=1)
# if microphone is not active (mic=0)
mic=0

# get settings about amixer 'Capture' (microphone) 
res=$(amixer -c 0 get 'Capture' | grep -o -m 1 '\[on\]')

# if the microphone is [off] will be turn on
if [[ $res == '[on]' ]];
then
    mic=1
    echo 'mic on'
else
    echo 'mic off'
    amixer -c 0 set 'Capture' cap
    echo 'mic turned on'
fi

# python script for transcription
python3 $stt

# if the microphone was off after the transcription script it turn off again
if [[ $mic -eq 0 ]];
then
    echo 'mic off now'
    amixer -c 0 set 'Capture' nocap
fi

exit 0