#!/bin/python3

# Python program to translate
# speech to text and text to speech

import speech_recognition as sr
import pyautogui
from notifypy import Notify
import os
import time


# notification system
def notification(which):
	noti = Notify()
	if which == 1:
		noti.title = "Speech-to-Text"
		noti.message = "Speak Anythings:"
	if which == 0:
		noti.title = "Speech-to-Text"
		noti.message = "Sorry could not recognize what you said"
	noti.send()
		
# listening and transcription system
r = sr.Recognizer()
x, y = pyautogui.position()

with sr.Microphone() as source:
	notification(1)
	r.adjust_for_ambient_noise(source)
	audio = r.listen(source, timeout=30)
	try:
		text = r.recognize_google(audio, language="it")
		print("You said: {}".format(text))
		pyautogui.click(x, y)
		pyautogui.typewrite(text)
	except:
		notification(0)