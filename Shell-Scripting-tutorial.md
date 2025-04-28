 # SHELL SCRIPTING TUTORIAL
 
 ## OBJECTIVE:
 This tutorial will provide basic understanding of shell scripting to automate tasks in a Linux environment.
By the end, you will be able to write, execute, and structure simple shell scripts. 
## overview:
1. what is shell scripting and bash?
2. what are the basic commands of Bash?
3. How to navigate paths in  shell?
4. How to create directories and files in shell?
5. Some important Bash commands and operators.
6. How to delete files and directories?
7. How to declare variables in Shell 
Scripting and how to use them?
8. Other functionalities
9. Conclusion
## 1. Shell Scripting & Bash:
Shell is a primary visual interface by which users can interact with the computers and commands the operating system to perform actions. Shell scripting means writing a series of commands for the shell to execute automatically.
 Bourne Again SHell, or “bash” for short is one of the types of shell. This is one of the most widely used shells.

 ## 2.Fundamental of BASH:
You can start off b executing simple commands like:

- **printing date:**
 You just have to write date on your shell and it will execute your command  
 ```bash
ammarahwakeel@DESKTOP-QI6H2EA:~$ date
Sun Apr 27 23:24:52 PDT 2025
```
- **Printing text**:
in above example while printing date you did not provide any arguments, but if we want to print text of our own will we do it as:
 ``` bash
 ammarahwakeel@DESKTOP-QI6H2EA:~$ echo HELLO WORLD

HELLO WORLD
```
### 3. Navigation in shell:
 - **current location**:
Shows your current location in the file system.Helps you know where you are.
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~$ pwd
/home/ammarahwakeel
```
- **List Files and Directories:**
Lists all files and folders inside the current directory.
You can also use options:
 ls -l → detailed list or ls -a → show hidden files. where -l or -a are flags which tells the shell to do something specific.
 ``` bash
 ammarahwakeel@DESKTOP-QI6H2EA:~$ ls
bad.py  git-practice  labexam  meds  mmodule0  module0
```
```bash
ammarahwakeel@DESKTOP-QI6H2EA:~$ ls -a
.              .bash_logout  .cache    .gitconfig  .motd_shown                .viminfo        git-practice  mmodule0
..             .bashrc       .dotnet   .landscape  .profile                   .vscode-server  labexam       module0
.bash_history  .c            .emacs.d  .lesshst    .sudo_as_admin_successful  bad.py          meds
```
 **NOTE** : In the above code some files have  **(.)** and some have **(..)** before there names. A single dot means Current directory (yourself) and double dot means Parent directory (one level up)
- **Change Directory**:
changing directory simply means moving to a different folder.
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~$ cd meds
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ 
```
**other options:**
 cd Documents/ → go into Documents
, cd .. → go one step back (up/ to the parent directory)
, cd / → go to root directory.

**NOTE** : By doing cd. you will still be in your present directory because a single dot refers to your current directory and by changing path to current directory you are still in your current directory.

- **PATH - Environment Variable**:

PATH is a special system variable that stores locations where the shell looks for executable programs.
``` BASH
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ echo $PATH

/home/ammarahwakeel/.vscode-server/bin/17baf841131aa23349f217ca7c570c76ee87b957/bin/remote-cli:/usr/local/sbin:/.................
(and the path goes on)
```
### 4. Creating Directories and Files in Shell:
- **mkdir — Make Directory**
to create a directory in the current location we do code as:
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ mkdir shell_practoce
```
**Other options:** 

"mkdir Project1 Project2 Project3" Create multiple directories named as project1,2,3 at once.
- **Creating Files**:
There are several ways to create files:
   1. **TOUCH**:
 Using touch
touch is the easiest way to create an empty file.
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~/meds/shell_practoce$ touch file1.txt
```

Creates an empty file called file1.txt in the shell_practoce directory. Like directories you can create multiple files at once by writing command as "touch file1.txt file2.txt file3.txt"

2. **Redirection Operator**:
In shell scripting, redirection operators are used to send output to files instead of the screen, or take input from files.
They control where data flows.
And you can create a file and write into it immediately by:
``` BASH
ammarahwakeel@DESKTOP-QI6H2EA:~/meds/shell_practoce$ echo "MAKING FILE BY REDIRECTION OPERATION" > FILE2.txt
```
This will make a file named as file2.txt conating text as mentioned above.

### 4. Removing Files and Directories in Shell:
- **Removing Files — rm**:
rm is used to delete a file.
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~/meds/shell_practoce$ rm FILE2.txt
```
**Other options:**
You can delete multiple files at once: "rm file1.txt file2.txt file3.txt".  
 You can also Remove Files by Pattern (using Wildcards) such as if you want to remove all the text files you write code as :
 ``` bash
 rm *.txt
 ```
- **Removing Directories — rmdir and rm -r**:
  1. **rmdir — Remove Empty Directory:**
Only works if the folder is empty. you write code as:
``` bash
rmdir foldername
```

  2. **rm -r — Remove Directory and Its Contents** : 
-r means recursive — it deletes the folder and everything inside it.
``` bash
rm -r foldername
```
### 5. Important Bash Commands & Opperators:
- **CAT**  :
View the content of a file or combine multiple files.
``` BASH
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ cat README.md
# MEDS Training Readme 
<p align="center">
  <img src="MEDS SS/meds pic.png" alt="MEDS Lab Picture" width="300"/>
</p>
This repository will contain all information about the training program of MEDS Lab..........
```

- **cp — Copy Files and Directories**:
Copy a file or directory to a new location.
```bash 
cp sourcefile.txt destinationfile.txt
```
- **ps — Process Status**:
View running processes on your system.
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ ps
  PID TTY          TIME CMD
 1675 pts/1    00:00:00 bash
13618 pts/1    00:00:00 ps
```
### 6. Bash Input/Output (I/O) Operators:
- **> — Output Redirection :**
Sends output into a file, replacing existing content.
```bash
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ echo hello world >hello.txt
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ cat hello.txt
hello world
```
- **>> — Output Redirection (Append)**: 
Adds output at the end of a file without deleting previous data.
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ echo THIS IS AMMARAHWAKEEL >>hello.txt
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ cat hello.txt
hello world
THIS IS AMMARAHWAKEEL
```
- **< — Input Redirection**:
Takes input from a file instead of keyboard.
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ cat < hello.txt
hello world
THIS IS AMMARAHWAKEEL
```
- **| — Pipe Operator**:
Takes output from one command and sends it as input to another command.
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~/meds$ date | cat
Mon Apr 28 03:20:51 PDT 2025
```
In this example, data prints the current date and time.| cat simply displays what date outputs.
### 7. Variables Declaration :
Like other programming languages, variables are used to store information that can be used and changed later in your script.
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~$ name="AMMARAH"
```
Then we can declare it again as
``` bash
ammarahwakeel@DESKTOP-QI6H2EA:~$ echo $name
AMMARAH
```
### 8. Other Functionality:
 we can use also use functions to automate a repitiive task. then we can also run loops like for and while loops.
 In shell scripting, loops repeat commands multiple times, and functions group commands to reuse them easily. A for loop runs through a list of items, while a while loop repeats as long as a condition is true. Functions help organize code and can take input values called arguments to perform flexible tasks.
  ### Conclusion:
  Shell scripting is a powerful way to automate tasks, manage files, and control processes efficiently. By learning basic commands, variables, loops, and functions, you can create scripts that save time and make your work faster and easier. 



