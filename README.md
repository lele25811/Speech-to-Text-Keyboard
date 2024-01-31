# Speech to Text
  Script for transcribing text from voice

## How does it work?
  `main.sh` checks whether the microphone is currently activated or not, the control is done with the `amixer` commands, and turns on it.
  the python script `Speech-to-Text.py` that takes care of the transcription is called, the dictated text will be inserted where the mouse cursor is located.
  At the end of the program the microphone is returned to its initial state.

## Requirements
  - speech_recognition   (python -> `pip install SpeechRecognition`)
  - pyautogui            (python -> `pip install PyAutoGUI`)
  - notifypy             (python -> `pip install notify-py`)

## Note
  The set language is Italian, but it can be changed from the Python script.
  There are comments in the script code on how it works.
