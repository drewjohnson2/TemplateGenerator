#!/bin/bash
# To run 'code' command make sure visual studio code
# is added to your path. Instructions can be found
# at https://code.visualstudio.com/docs/setup/mac

# Script is most useful when an alias as been added
# to your .bash_profile file. For example:
# alias temp="cd /Users/drewjohnson/desktop/programming/shellscripts; ./filegenerator.sh"
# at this point I can type in "temp arg1 arg2" in my
# terminal session and a file will be created in
# the desired location and then be opened.

tempMan="/Users/drewjohnson/desktop/programming/shellscripts/Templates/TempMan.txt"

if [ $1 ]
then
	fileName=$1
	
	if [ $2 ]
	then
		fileType=$2
		
		if [ $3 ]
		then
			editor=$3
		
		else
			editor=code
		fi

	else
		echo "Second argument needed: temp $fileName *file type*"
		exit 0
	fi
else
	cat $tempMan
	exit 0
fi

javaTemp="/Users/drewjohnson/desktop/programming/shellscripts/Templates/JavaTemp"
cppTemp="/Users/drewjohnson/desktop/programming/shellscripts/Templates/cppTemp"
cTemp="/Users/drewjohnson/desktop/programming/shellscripts/Templates/cTemp"
pythonTemp="/Users/drewjohnson/desktop/programming/shellscripts/Templates/PythonTemp"
python3Temp="/Users/drewjohnson/desktop/programming/shellscripts/Templates/Python3Temp"

cPath="/Users/drewjohnson/desktop/programming/C/$fileName.c"
cppPath="/Users/drewjohnson/desktop/programming/cpp/$fileName.cpp"
javaPath="/Users/drewjohnson/desktop/programming/java/$fileName.java"
pythonPath="/Users/drewjohnson/desktop/programming/Python/$fileName.py"
python3Path="/Users/drewjohnson/desktop/programming/Python/$fileName.py"

shopt -s nocasematch

case $fileType in
	
	"c") cat "$cTemp" >> $cPath && $editor $cPath;;

	"cpp") cat "$cppTemp" >> $cppPath && $editor $cppPath;;

	"c++") cat "$cppTemp" >> $cppPath && $editor $cppPath;;

	"java") cat "$javaTemp" >> $javaPath && $editor $javaPath;;
	
	"python") cat "$pythonTemp" >> $pythonPath && $editor $pythonPath;;

	"python3") cat "$python3Temp" >> $python3Path && $editor $python3Path;;

	*) echo "I don't support that language yet!";;
esac
