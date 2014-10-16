echo "Removing files from temp folder."
rm temp/*

cd testCases/
while read p; do
	echo $p
done <testCase1.txt

# cd testCasesExecutables/
# python test.py > ../temp/output.html

# echo "Opening results file in default browser."
# cd ../temp
# xdg-open output.html