# TemplateGenerator
This shell script will generate a template for a specified programming language, save the template in your path, and then will open the template in an editor of your choosing. The default editor used for this script is Sublime through use of an alias, however you can edit the default editor to be one of your choosing. (i.e. Vim, emacs, Visual Studio Code, Atom etc).

## Languages Supported
 * C
 * C++
 * Java
 * Python
 * PHP
 * Shell
 
## Adding Support for a langauge
 You can add supoort for different languges of your choice by adding the path to your template for that language, the path to the directory you want to save the file to (like in lines 43 through 48) and a line like below in the case statment in the script:
 <br /><br />
 ```"newlanguage") cat "$newLangaugeTemp" >> $newLanguagePath && $editor $newLanguagePath;;``` <br /><br />
 Where ```newlangauge``` is the argument given for the new language, ```$newLanguageTemp``` is the variable containing the path to the template for this new langague and ```$newLanguagePath``` is the path to where the new file will be saved.
## Arguments
filegenerator.sh accepts up to two arguments: Filename and extension and editor (optional). If no arguements are given, the script manual is displayed.
### No Arguments
The script manual is displayed. You'll need to edit line 13 to the correct path to the manual text file.
### First Argument
The name of the new file and extension.
 <br /><br />
 Example:  <br /><br />
 ```temp filename.ext```
### Second Argument (Optional)
The second argument is the editor to be used. Without this second argument the script will default to Sublime (or the default editor of your choice).
 <br /><br />
 Examples:
  <br /><br />
 ```temp newFile.java vi```
 <br />
 ```temp newerFile.c emacs```
 <br /><br />
**It is important that the second argument match the corresponding case statement in the script (Lines 43 through 48)**
## Modification
You will need to make modifications to lines 13, 35 through 40, and 43 through 48 to get the script working correctly on your system. In addition, you will need to add an alias to your .bash_profile file in order for your command to work.
### .bash_profile
Script is most useful when an alias as been added to your .bash_profile file. For example: <br /> <br />
```alias temp="cd /Users/drewjohnson/desktop/programming/shellscripts; ./filegenerator.sh"``` <br /><br />
This is useful because you'll be able to type ```temp arg1.ext arg2``` to create a new template as opposed to having to navigate to your directory containing the shell script and then writing out ```./filegenerator.sh arg1.ext arg2```. It's a nice time saver. Of course you'll have to edit the path in the example alias above to the path to the shell script on your system. This alias can have whatever name you choose.
### Default Editor
The default editor in the script currently is Sublime. You can choose the defaut editor by changing line number 26. So, if I would like to change the default editor from Sublime to Vim for example I would change line 26 from <br /><br />
```editor=code```
<br /><br />
to <br /><br />
```editor=vim```. <br /> <br />
If you would like to keep the default editor Sublime you will first need to make sure that it is included in your path. Sublime is a bit troublesome when it comes to this so I created an alias to save myself sometime.

### Line 13
When you pull from this repository you will receive a file titled ```TempMan.txt```. ```TempMan.txt``` is a manual that contains information about arguments used and optional arguments. As you add more templates to your path and edit the shell script you can update this file to reflet those changes. <br /><br />
This file is located in the Templates directory included in the pull. You'll need to edit line 13 from ```tempMan="/Users/drewjohnson/desktop/programming/shellscripts/Templates/TempMan.txt"``` to the path where you save these files. 
<br /><br />
For example <br /><br />
```tempMan="/Path/to/the/directory/Templates/TempMan.txt"```
### Lines 35 through 40
This is going to be the path to your templates. These templates are located in the Template directory. You want to edit these lines (while keeping variable names) to reflect the location of these templates in your path. 
### Lines 43 through 48
These lines are the paths to directories that you want to save your new template to. Currently in the script if I were to type into the terminal ```temp newjavafile.java``` the script would save a file called ```newjavafile.java``` in the path I have specified for java files. I like to keep source code for different languages in corresponding files, however if you choose, you can have these files save to whatever directory you wish. <br /><br />
If you choose to keep things within the same format as me, you want to change these lines to the paths you want to save your files to. <br /><br />
For example <br /><br />
```cPath="/path/to/your/C/files/$fileName"``` <br /><br />
and without it you will get some unfavorable results.
## Changes
### December 20, 2017
I changed the format of the script from taking a possible of three arguments to two. When I wrote the script I didn't have as much time to work on it as I would have liked so I didn't have a chance to research how to implement time saving elements. <br />
After using this script many times while working I realized just how cumbersome it was to type ```temp filename extension``` as opposed to the more natural approach ```temp filename.ext```. I finally found some free time and was able to make the logical change to the script. <br /><br />
In addition I've added some additional language support as well as adding a line to the script that allows aliases.
