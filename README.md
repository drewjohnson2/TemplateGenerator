# TemplateGenerator
This shell script will generate a template for a specified programming language, save the template in your path, and then will open the template in an editor of your choosing. The default editor used for this script is Visual Studio Code, however you can edit the default editor to be one of your choosing. (i.e. Vim, emacs, Sublime etc).

## Languages Supported
 * C
 * C++
 * Java
 * Python (both 2 and 3)
## Adding Support for a langauge
 You can add supoort for different languges of your choice by adding the path to your template for that language, the path to the directory you want to save the file to (like in lines 46 through 50) and a line like below in the case statment in the script:
 <br /><br />
 ```"newlanguage") cat "$newLangaugeTemp" >> $newLanguagePath && $editor $newLanguagePath;;``` <br /><br />
 Where ```newlangauge``` is the argument given for the new language, ```$newLanguageTemp``` is the variable containing the path to the template for this new langague and ```$newLanguagePath``` is the path to where the new file will be saved.
## Arguments
filegenerator.sh accepts up to three arguments: Filename, file type, and editor (optional). If no arguements are given, the script manual is displayed.
### First Argument
The name of the new file.
 <br /><br />
 Example:  <br /><br />
 ```temp filename arg2```
### Second Argument
Type of file to be created (Python, C++, Java etc.)  <br /><br />
Example:  <br /><br />
```temp arg1 java```
### Third Argument (Optional)
The third argument is the editor to be used. With out this third argument the script will default to Visual Studio Code (or whatever you editor you choose).
 <br /><br />
 Examples:
  <br /><br />
 ```temp newFile java vi```
 <br />
 ```temp newerFile C emacs```
 <br /><br />
**It is important that this second argument match the corresponding case statement in the script (Lines 46 through 50)**
## Modification
You will need to make modifications to lines 13, 40 through 44, and 46 through 50 to get the script working correctly. In addition, you will need to add an alias to your .bash_profile file in order for your command to work.
### .bash_profile
Script is most useful when an alias as been added to your .bash_profile file. For example: <br /> <br />
```alias temp="cd /Users/drewjohnson/desktop/programming/shellscripts; ./filegenerator.sh"``` <br /><br />
This is useful because you'll be able to type ```temp arg1 arg2``` to create a new template as opposed to having to navigate to your directory containing the shell script and then writing out ```./filegenerator.sh arg1 arg2```. It's a nice time saver. Of course you'll have to edit the path in the example alias above to the path to the shell script on your system. This alias can have whatever name you choose.
### Default Editor
The default editor in the script currently is Visual Studio Code. You can choose the defaut editor by changing line number 28. So, if I would like to change the default editor from Visual Studio Code to Vim for example I would change line 28 from <br /><br />
```editor=code```
<br /><br />
to <br /><br />
```editor=vim```. <br /> <br />
If you would like to keep the default editor Visual Studio Code you will first need to make sure that it is included in your path. More information on this can be found at https://code.visualstudio.com/docs/setup/.

### Line 13
When you pull from this repository you will receive a file titled ```TempMan.txt```. ```TempMan.txt``` is a manual that contains information about arguments used and optional arguments. As you add more templates to your path and edit the shell script you can update this file to reflet those changes. <br /><br />
This file is located in the Templates directory included in the pull. You'll need to edit line 13 from ```tempMan="/Users/drewjohnson/desktop/programming/shellscripts/Templates/TempMan.txt"``` to the path where you save these files. 
<br /><br />
For example <br /><br />
```tempMan="/Path/to/the/directory/Templates/TempMan.txt"```
### Lines 40 through 44
This is going to be the path to your templates. These templates are located in the Templet directory. You want to edit these lines (while keeping variable names) to reflet the location of these templates in your path. 
### Lines 46 through 50
These lines are the paths to directories that you want to save your new template to. Currently in the script if I were to type into the terminal ```temp newjavafile java``` the script would save a file called ```newjavafile.java``` in the path I have specified for java files. I like to keep source code for different languages in corresponding files, however if you choose, you can have these files save to whatever directory you wish. <br /><br />
If you choose to keep things within the same format as me, you want to change these lines to the paths you want to save your files to. <br /><br />
For example <br /><br />
```cPath="/path/to/your/C/files/$fileName.c"``` <br /><br />
**Note: it is important you keep the last part that reads ```$fileName.c```. This will be the name and extension of your file and without it you will get some unfavorable results.**
