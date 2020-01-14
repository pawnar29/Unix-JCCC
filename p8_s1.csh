#! /bin/csh
# The following script inplements a C Shell time clock system

# R08_001_790047 Making the log file and what to print to it
set log = '~/Lab8/timeclock.txt'

reset:

# R08_002_790047
date +"%Y-%m-%d %H:%M:%S" >> $log
echo $user >> $log

start:

set userID = ''

echo "Select from the following menu: "
cat << EOF
	1) Clock In
	2) Clock Out
	3) Print Log
	4) Print User
	5) Quit
EOF
echo -n "Option: "
set choice = $<
switch ("$choice")
case 1:
# R08_003_790047 Clocks in and prints it in the log file
	echo "CLOCK IN" >> $log
	echo "Clocked In"
	goto reset
	breaksw
case 2: 
# R08_004_790047 Clocks out and prints it in the log file
	echo "CLOCK OUT" >> $log
	echo "Clocked Out"
	goto reset
	breaksw
case 3:
# R08_005_790047 Prints the log file one page at a time
	echo "Printing Log"
	cat $log | less
	goto reset
	breaksw
case 4:
# R08_006_790047 Reads in and user ID and prints in the clock in record
	echo -n "Enter a User ID: "
	set userChoose = $<
	grep -B 2 "CLOCK IN" $log | grep -C 1 "$userChoose" | less
	goto reset
	breaksw
case 5:
# R08_007_790047 Terminates the script
	exit 25
	echo "Exiting"
	breaksw
default:
# R08_008_790047 Prints out an error and then starts the menu again
	echo "Invalid Input"
	echo
	goto start
endsw



