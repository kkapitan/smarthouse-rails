import RPi.GPIO as GPIO
import sys

GPIO.setmode(GPIO.BOARD)
GPIO.setwarnings(False)

pin = int(sys.argv[1])
state = GPIO.LOW if sys.argv[2] == '0' else GPIO.HIGH

GPIO.setup(pin,GPIO.IN)
currState = GPIO.input(pin)
GPIO.setup(pin,GPIO.OUT)

GPIO.output(pin,state)
if (state == currState):
	exit(1)
else:
	exit(0)
