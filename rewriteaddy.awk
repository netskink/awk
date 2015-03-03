#!/usr/bin/awk -f

# reads from stdin. 
# Usage: $ ./rewriteaddy.awk < foo.csv



# Run at start.
BEGIN { 
#	print "Start" 
#	print "CSV setting. Field seperator set to comma."
	FS = ","
}

# main. Run for each record. This code uses newlines to denote records.
{
	# Print the entire line
	#print $1, "\t", $2, "\t", $3, "\t", $4, "\t", $5

	# Print lines which are of this form:
	# #+ #+ ANYTHING,
	# ie. print lines which have 1 or more numbers, space, 1 number and anything, space and 
	# anything in the first field.
#	if ($1 ~ /[0-9] [0-9]+ .*/) print $1
	findit = match($0, /[0-9] ([0-9]+.*)/,arr)
	if (findit != 0) {
		# arr[0] is the entire string matching the regexp
		# arr[1] is the substring matching the first parenthesis portion
		print arr[1]
	} else {
		# nothing matched so print the entire line
		print $0
	}
}

# run at end
#END { print "Stop" }

