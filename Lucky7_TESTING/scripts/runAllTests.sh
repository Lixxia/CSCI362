#!/bin/bash

# check if temp directory is empty. If not, remove files.
FILE=""
DIR="temp/"
if [ "$(ls -A $DIR)" ]; then
	echo "Removing files from temp folder."
	rm temp/*
else
	echo "Temp folder is already empty."
fi

# Static html elements and css styling
while read LINE; do
	echo "$LINE" >> temp/output.html
done < "reports/style.css" 

# rewrite this to walk through folder instead of hardcoding a loop -> pre-pend 0 to single digit tests
# for file in bleh
# perform these actions 25 times, once for each test.
NUMFILES="$(ls -1 testCases/ | wc -l)"
echo "$NUMFILES"

for i in `seq 1 "$NUMFILES"`; do
	echo "Performing test $i."
	FILE="testCases/testCase$i.txt"
	# create an array and populate it with contents of testCase file
	ARRAY=()
	while read LINE; do
		ARRAY+=("$LINE")
	done < "$FILE"

	# creating the table row in output.html with appropriate information
	echo "<tr id='colorme$i'>
	<td id='colortext$i'>${ARRAY[0]}</td>
	<td id='colortext$i'><a name='"${ARRAY[1]}"' class="tooltip"><i class='fa fa-external-link'></i></a></td>
	<td id='colortext$i'>${ARRAY[2]}</td>
	<td id='colortext$i'>${ARRAY[3]}</td>" >> temp/output.html
	# color these fields in the table based on true/false
	if  [ "${ARRAY[4]}" == "True" ]; then
		echo "<td id='truec'>${ARRAY[4]}</td>" >> temp/output.html
	else
		echo "<td id='falsec'>${ARRAY[4]}</td>" >> temp/output.html
	fi


	# running actual test and receiving output, must cd for test.py to work
	cd testCasesExecutables/
	OUTPUT=$(python test.py ${ARRAY[2]} ${ARRAY[3]})
	# also t/f color these fields in the table
	if  [ "$OUTPUT" == "True" ]; then
		echo "<td id='truec'>$OUTPUT</td>" >> ../temp/output.html
	else
		echo "<td id='falsec'>$OUTPUT</td>" >> ../temp/output.html
	fi
	cd ..

	# Check if test passed or failed by comparing to oracle and output result in table
	# color entire row and show icon based on pass/fail
	if [ "${ARRAY[4]}" == "$OUTPUT" ]; then
		echo "<td id='colortext$i'><i class='fa fa-check'></i></td></tr>
		<style>#colorme$i {background-color: #dff0d8;} #colortext$i {color:#3c763d;}</style>" >> temp/output.html
	else
		echo "<td id='colortext$i'><i class='fa fa-close'></i></td></tr>
		<style>#colorme$i {background-color: #f2dede;} #colortext$i {color:#a94442;}</style>" >> temp/output.html
	fi
done

# closing off the table
echo "</table>" >> temp/output.html

# open results in browser
echo "Tests complete; opening results in default browser."
xdg-open temp/output.html 2> /dev/null