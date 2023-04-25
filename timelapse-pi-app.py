
from picamera2 import Picamera2, Preview
from time import sleep
import time
import os
import random
import string
import sys

def get_random_string(length):
    result_str = ''.join(random.choice(string.ascii_letters) for i in range(length))
    return result_str


# Check if the correct number of arguments were provided
if len(sys.argv) != 3:
    print("Usage: python timelapse-app-pi.py <number_of_pictures> <delay_seconds>")
    sys.exit(1)

# Parse the arguments
number_of_pictures = int(sys.argv[1])
delay_s = int(sys.argv[2])

# Use the arguments as needed
print(f"Number of pictures: {number_of_pictures}")
print(f"Delay: {delay_s}")

timestr = time.strftime("%Y-%m-%d_%H-%M-%S")
path=f'tl_{timestr}'

if not os.path.exists(path):
    os.mkdir(path)
else:
    path = path + get_random_string(5)

print("Folder %s created!" % path)


picam2 = Picamera2()
#capture_config = picam2.create_still_configuration()
picam2.start_and_capture_files(f'{path}/timelapse'+"-{:d}.jpg", delay=delay_s, num_files=number_of_pictures, show_preview=False)


