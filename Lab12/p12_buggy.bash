#! /bin/bash

# R12_001_790047

if (( $# < 3 ))
then
    echo "Run this script with any 3 positional parameters"
    exit
fi
##### To get the actual date, the command has the be between ``
echo "Today's date is: " `date`
echo
##### Missing a quote at the end
echo "Now is the time for all"
echo
##### variable val has to be declared, cannot have space in arithmatic operations
declare -i val=10*10
echo "10 times 10 is $val"
echo
##### The 3rd positional parameter is $3, not $2
echo "The third positional parameter is set to: $3"
echo
cat frog.txt 2>/dev/null
##### if command succeeded, exit status would be 0, anything else is it failed
if (( $? == 0 ))
then
    echo 'cat frog.txt succeeded'
fi
echo
echo "Enter your name: "
read name
##### Wrong type of quotes
echo "Your name is $name"
echo
name=Frank
##### == to check if 2 things are equal
if (( $name == "Frank" ))
then
    echo 'My name is Frank because $name' " is $name"
fi
echo
# Printing 1 through 5
##### Has to start at 1, for 1 to 5
i=1
##### Has to be <=, has to include 5
while (( i <= 5 ))
do
    echo $i
    let i+=1
done
echo
echo "Enter your age: "
read age
if (( age >= 50 ))
then
    echo "You are 50 or older"
elif (( age >= 40 ))
then
    echo "You are 40 or older"
##### This has to be >= 30 because it's 30 or older
elif (( age >= 30 ))
then
    echo "You are 30 or older"
elif (( age >= 20 ))
then
    echo "You are 20 or older"
elif (( age >= 10 ))
then
    echo "You are 10 or older"
fi
# Checking for blue
for color in "red" "yellow" "green" "blue" "black" ;
do
##### $blue is not a declared variable, statement is looking for the string value blue
    if [[ $color == "blue" ]]
    then
        echo "I found blue!"
        break
    fi
done
echo

