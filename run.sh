#!/bin/bash

if [ $# -ne 3 ];
then 
    echo "run.sh <start_time> <end_time> <num_of_pictures>"
    exit 1
fi

echo ""
printf '=%.0s' {1..20}
echo -ne " TimelapsePi "
printf '=%.0s' {1..20}
echo -ne "\n\n"

printf '*%.0s' {1..55}
echo -ne "\nAll output logs are saved to nohup file\n"
echo -ne "After you proceed, the command will be executed at given date (closest)\n"
echo -ne "Do not run many instances at one time\n"
echo -ne "You can check planned executions using 'atq'.\n"
echo "Check 'at' package docs for more info"
printf '*%.0s' {1..55}
echo -ne "\n\n"

echo -ne "- Current date: "
date

start_time=$1 #ex. 13:00
end_time=$2 #ex. 15:00
n_pic=$3

start_seconds=$(date -d "$start_time" +%s)
end_seconds=$(date -d "$end_time" +%s)
time_dif=$(($end_seconds - $start_seconds))

delay=$((time_dif / n_pic))

echo -ne "\n- Parameters: \n"
echo -ne "-- start_time = $1\n"
echo -ne "-- end_time = $2\n"
echo -ne "-- number_of_pictures = $3\n"
echo -ne "-- delay_between_pictures [ms] = $delay\n\n"

while true; do
    read -p "Continue? (y/n) " answer
    case $answer in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer y or n.";;
    esac
done

echo -ne "=> Continuing...\n\n"

#echo $delay
#echo $((time_dif / n_pic))
#echo $n_pic

echo "nohup python timelapse-pi-app.py $n_pic $delay &" | at $start_time 
echo ""