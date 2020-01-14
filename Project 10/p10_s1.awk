#! /bin/awk -f 

# R10_001_790047 This will convert every word to lowercase before processing them
{
	$0 = tolower($0);

# R10_002_790047 The script below will count punctuation as separate words

	gsub(/[^[:alnum:]_[:blank:]]/, "", $0);

# R10_003_790047 The script below will count the number of distinct words

	for(i = 1; i <= NF; i++)
	{
# R10_004_790047 The script below will count the number of words of each of each distinct word
		freq[$i]++;
	}
}
# R10_005_790047 The output
END{
	printf "%s%21s\n", "Index", "Word Count";
	n = asorti(freq ,word);
	for (i = 1; i <= n; i++)
	{
		printf "%5d%15s%6d\n", i, word[i], freq[word[i]];
	}
}

# R10_006_790047 This is put in the terminal
# Lab10/p10_s1.awk /home/faculty/clocke1/project_8/constitution.txt > Lab10/p10_s1_out.txt

