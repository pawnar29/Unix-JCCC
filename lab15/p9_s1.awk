#! /bin/awk -f

BEGIN{
# Breaks the data into fields based off of commas
	FS = ","
# Declaring the variables that are used in the statements
	max = 0
	min = 0
	state = ""
	max_snow = 0
	max_snow_state = ""
}


/Missouri/{

# R09_001_790047 This will look if the first field is Missouri and will
#	display the name, date and location of entry

	printf "%-10s %s,%-10s %s\n", $1, $6, $7, $8
}

# R09_002_790047 This looks for all entries that pertain to Kansas
/^Kansas/{
state = $1
# This checks if it is to do with temperature
	if ($5 == "degrees F")
	{
		# Sets the maximum and minimum values
		if ($4 > max)
			max = $4
		else if ($4 < max && $4 < min)
			min = $4
	}
}

# R09_003_790047 Searches the file for the 4 states and prints the largest snowfall
# This will also collect the state and the largest snowfall of them all and display them at the bottom
/California/ || /Colorado/ || /Vermont/ || /Wyoming/{
	if ($2 ~ "Snowfall")
	{
		printf "%-10s\t%.1f %s\n", $1, $4, $5
		if ($4 > max_snow)
		{
			max_snow = $4
			max_snow_state = $1
		}
	}
}
{
# R09_004_790047 Displays all data related to wind
	if ($0 ~ "[Ww]ind")
		print $0
}

END{
# Prints off stream has to do with R09_002_790047
	print state "'s Difference in temperature is " max+ ((min < 0) ? min*(-1) : min)
# Prints the state and the maximum snowfall, part of R09_003_790047
	print max_snow_state " has the most amount of snow and that is " max_snow " inches"	
}
