#!/bin/python3
# script per scrittore dal microfono

# Python program to translate
# speech to text and text to speech


# script funzionante solo in inglese
import speech_recognition as sr
import pyautogui
import time

# Initialize the recognizer 
r = sr.Recognizer()
x, y = pyautogui.position()

with sr.Microphone() as source:
	print("Speak Anythings: ")
	r.adjust_for_ambient_noise(source)
	audio = r.listen(source, timeout=30)
	try:
		text = r.recognize_google(audio, language="it")
		print("You said: {}".format(text))
		pyautogui.click(x, y)
		pyautogui.typewrite(text)
	except:
		print("Sorry could not recognize what you said")