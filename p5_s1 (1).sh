#! /bin/sh


# R05_001 This line accepts a parameter of a filename that the program will look for

filename=$1

# R05_002 This declares the log file that logs all events to the file ~/.trashlog

trashLog=~/.trashlog 

if [ ! -d ~/trash ]
then
	
mkdir ~/trash

fi 

# R05_003 This checks if the file exists

if [ -f $filename ]
then

	# R05_005 If the file does not exist in the ~/trash, it moves the file to ~/trash

	# This is a additional portion of R05_004 copied over
	
	if [ -f ~/trash/${filename##*/} ]
then

		existing=~/trash/${filename##*/}"_bak"
		
		echo "$(date "+%F %T") - Trash renamed $filename to $existing" >> $trashLog

		mv ~/trash/${filename##*/} $existing

	fi

	# R05_005 Originally starts right here to do the tasks
	
	newFilename=~/trash/${filename##*/}

	echo "$(date "+%F %T") - Trash moved $filename to $newFilename" >> $trashLog

	mv $filename $newFilename


elif [ -f ~/trash/${filename##*/} ] 
then

	# R05_004 If the file does exist in the file location, it renames the file

	newfilename=~/trash/${filename##*/}"_bak"

	echo "$(date "+%F %T") - Trash renamed $filename to $newfilename" >> $trashLog

	mv ~/trash/${filename##*/} $newfilename
else
	
# R05_003 If the file does not exist, it prints out this line into the log

	echo "$(date "+%F %T") - Trash of $filename does not exist" >> $trashLog

fi
