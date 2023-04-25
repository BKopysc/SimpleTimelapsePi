# SimpleTimelapsePi
Simple timelapse application for Raspberry Pi with camera module. 
The main goal was to schedule the timelapse to run in the background at a certain time. This way you can leave the SSH connection and go to sleep peacefully 😴.

## Requirements
- Python 3.x
- pip
- RaspberryPi
- Camera module

## Used libraries
- `at` - linux command
- `picamera2` - python library

## Installation
1. clone repo
2. run `pip -r requirements.ts`
3. open and run commands from file `sh-requirements.txt`

## Usage
There are two modes. You can use simple shell script (recommended) or python script

### Shell script
1. Make script executable: `chmod +x run.sh`
2. Run `./run.sh <start-time> <end-time> <number-of-photos>` with custom arguments. 
 - `<start-time>` - start time of shooting photos. <br/> *For example: **10:00***
 - `<end-time>` - end time of shooting photos. <br/> *For example: **10:30***
 - `<num-of-pictures>` - number of expected photos. <br/> *For example: **100***
 
 > Summary: `./run.sh 10:00 10:30 100` will make 100 photos between 10:00 and 10:30.
 
 3. Read output informations and proceed with `y`
 4. Congrats 🥳. Your timelapse will start up at the set time! Then check folders in current location!
 
 > You can check planned actions by `atq` command. You can remove planned action by `atrm <action_id>`
 
 ## Python file
 1. Run `python timelapse-pi-app.py` <number-of-photos> <delay> with custom argumnets.
 - `<number-of-photos>` - number of expected photos. <br/> *For example: **100***
 - `<delay>` - delay between photos in miliseconds. <br/> *For example: **200***
 
 > Summary `python timelapse-pi-app.py 100 200` will instantly run process and make 100 photos with deleay of 200ms between each other.
 
 2. Hooray 🥂. Your timelapse are done! Check folders in current location!
