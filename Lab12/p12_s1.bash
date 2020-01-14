#! /bin/bash

# R12_002_790047 This script converts a given string to morse code

# R12_004_790047 Associative array declarations
declare -A letters
letters["A"]=".-,"
letters["B"]="-...,"
letters["C"]="-.-.,"
letters["D"]="-..,"
letters["E"]=".,"
letters["F"]="..-.,"
letters["G"]="--.,"
letters["H"]="....,"
letters["I"]="..,"
letters["J"]=".---,"
letters["K"]="-.-,"
letters["L"]=".-..,"
letters["M"]="--,"
letters["N"]="-.,"
letters["O"]="---,"
letters["P"]=".--.,"
letters["Q"]="--.-,"
letters["R"]=".-.,"
letters["S"]="...,"
letters["T"]="-,"
letters["U"]="..-,"
letters["V"]="...-,"
letters["W"]=".--,"
letters["X"]="-..-,"
letters["Y"]="-.--,"
letters["Z"]="--..,"

letters["1"]=".----,"
letters["2"]="..---,"
letters["3"]="...--,"
letters["4"]="....-,"
letters["5"]=".....,"
letters["6"]="-....,"
letters["7"]="--...,"
letters["8"]="---..,"
letters["9"]="----.,"
letters["0"]="-----,"
letters[" "]="SP,"

#Gets the words
text=$1

# R12_003_790047 This portion of code checks if the input string is all caps and numbers, plus spaces
if [[ $text =~ [^A-Z0-9[:space:]] ]];
then
	echo "INVALID String"
	exit 10
fi
# Displays the morse code
for (( i = 0; $i < ${#text}; i = $i + 1 ));
do
	printf "%s" ${letters[${text:$i:1}]}
done
printf "%s\n" "EOT"
