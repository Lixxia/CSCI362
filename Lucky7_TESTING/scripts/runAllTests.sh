echo "Removing files from temp folder."
rm temp/*


cd testCases/
python test.py > ../temp/output.html

echo "Opening results file in default browser."
cd ../temp
xdg-open output.html