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

# Static html elements and css styling (headers, need only once.)
echo "
<link href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css' 
rel='stylesheet'>
<style> 
table, th, td {
	border: 1px solid black;
	border-collapse: collapse; }
th, td {
	padding: 5px;
	text-align: center; }
.tooltip {
	display:inline;
	position:relative; }
.tooltip:hover:after { 
	background:#333; 
	background:rgba(0,0,0,.8); 
	border-radius: 5px;
	bottom: -3px; 
	color: #fff;
	content: attr(name); 
	left: 50px; 
	padding: 5px 15px;
	position: absolute; 
	z-index: 999; 
	width: 350px; }
th {
	background-color: rgb(100,100,100);
    color: white;
    padding: 10px 10px;
    text-align: center;
	border: none; }
td {
	border-color: rgba(0,0,0,.2); }
#truec {background-color: #dff0d8;color:#3c763d;}
#falsec {background-color: #f2dede;color:#a94442;}
</style>" >> temp/output.html
echo "<center><table><tr>
<th>Test</th><th>Requirement</th><th>Method</th>
<th>Input</th><th>Oracle</th><th>Output</th><th>Result</th>
</tr>" >> temp/output.html

# perform these actions 25 times, once for each test.
for i in `seq 1 25`; do
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


	# running actual test and receiving output
	cd testCasesExecutables/
	OUTPUT=$(python test.py ${ARRAY[2]} ${ARRAY[3]})
	# also t/f color these fields in the table
	if  [ "$OUTPUT" == "True" ]; then
		echo "<td id='truec'>$OUTPUT</td>" >> ../temp/output.html
	else
		echo "<td id='falsec'>$OUTPUT</td>" >> ../temp/output.html
	fi
	# echo "<td id='colortext$i'>$OUTPUT</td>" >> ../temp/output.html
	cd ..

	# Check if test passed or failed by comparing to oracle
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