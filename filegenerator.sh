#!/bin/bash

# Script is most useful when an alias as been added
# to your .bash_profile file. For example:
# alias temp="cd /Users/drewjohnson/desktop/programming/shellscripts; ./filegenerator.sh"
# at this point I can type in "temp arg1 arg2" in my
# terminal session and a file will be created in
# the desired location and then be opened.

# Allows the use of aliases
shopt -s expand_aliases

tempMan="/Users/drewjohnson/desktop/programming/shellscripts/TemplateGenerator/Templates/TempMan.txt"

if [ $1 ]							# If block checks for arguments
then
	fileName=$1

	extension=${fileName##*.}
	
	if [ $2 ]
	then
		editor=$2

    else
    	editor='subl'
    fi

else
	cat $tempMan
	exit 0
fi

# Paths to templates
javaTemp="/Users/drewjohnson/desktop/programming/shellscripts/TemplateGenerator/Templates/JavaTemp"	   
cppTemp="/Users/drewjohnson/desktop/programming/shellscripts/TemplateGenerator/Templates/cppTemp"	   
cTemp="/Users/drewjohnson/desktop/programming/shellscripts/TemplateGenerator/Templates/cTemp"		   
python3Temp="/Users/drewjohnson/desktop/programming/shellscripts/TemplateGenerator/Templates/Python3Temp"  
phpTemp="/Users/drewjohnson/desktop/programming/shellscripts/TemplateGenerator/Templates/PHPTemp"
shellTemp="/Users/drewjohnson/desktop/programming/shellscripts/TemplateGenerator/Templates/shellTemp"

# Paths to where files are to be saved
cPath="/Users/drewjohnson/desktop/programming/C/$fileName"			  
cppPath="/Users/drewjohnson/desktop/programming/cpp/$fileName"		  
javaPath="/Users/drewjohnson/desktop/programming/java/$fileName"	  
python3Path="/Users/drewjohnson/desktop/programming/Python/$fileName" 
phpPath="/Users/drewjohnson/desktop/programming/PHP/$fileName"
shellPath="/Users/drewjohnson/desktop/programming/shellscripts/$fileName"

# Turn off case sensitivity
shopt -s nocasematch	

# Case block checks $extension and creates, saves, and opens file
case $extension in	
	
	"c") cat "$cTemp" >> $cPath && $editor $cPath;;					    

	"cpp") cat "$cppTemp" >> $cppPath && $editor $cppPath;;				

	"java") cat "$javaTemp" >> $javaPath && $editor $javaPath;;			
	
	"py") cat "$python3Temp" >> $python3Path && $editor $python3Path;;	
	
	"php") cat "$phpTemp" >> $phpPath && $editor $phpPath;;

	"sh") cat "$shellTemp" >> $shellPath && $editor $shellPath;;

	*) echo "I don't support that language yet!";;
esac
