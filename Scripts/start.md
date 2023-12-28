## SHELL/BASH(Born Again SHELL) SCRIPT
Shell scripting is a way to automate tasks, run commands, and create simple programs using a shell, which is a command-line interpreter. The most common shell used in Unix-like operating systems is Bash (Bourne Again SHell)
```
ubuntu@sep2023:~$mkdir scripts                                    ## Create a common directory
ubuntu@sep2023:~$touch myscript.sh                                ## Craete a script file
ubuntu@sep2023:~$chmod u+x myscript.sh                            ## Grant executable permission to user
ubuntu@sep2023:~$vim  myscript.sh                                 ## Edit  script file
```

####  Shebang:
-  The **shebang** is a special line at the beginning of a script that tells the system which interpreter to use
```
#!/bin/bash
```
#### Print:
- The echo utility writes its arguments to standard output. The **echo** is equivalent to **printf**
```
echo -e "Date is: $(date +%d) \nDay is: $(date +%)"              ## The option -e enable interpretation of backslash escapes
```
#### Variables:
- Variables are used to store data(Key value pair). Variable names are case-sensitive
```
NAME="Jerry"
echo "Hello, $NAME!"
```
#### User Input:
- It can get user input using the read command
```
echo "What is your name?"
read user_name                                                  ## read -p "message" option can be used to print the question
echo "Hello, $user_name!"
```
#### Script arguments
- $0, $1, $2 ... $n are using to repersent script arguments.
- **$0** indicates the file name,  **$1** indicates the first argument(just after the script filename)
- **$#** indicates positional arguments(It will print total count of the arguments by default)
- **$*** indicates  all arguments
  ```
  if [ $# == 0 ];
  then
    echo -e  "Usage: ./myscript.sh <argument1> <argument2> \n Example: ./myscript.sh jerry 30"
    exit 0                                                    ## "> 0" indicates the exit status with Error
  fi
  ```
#### Conditionals:
- Conditional statements allow you to make decisions in your script
```
if [ "$NAME" == "John" ];
then
  echo "You are John!"
elif [ "$NAME" == "Jerry" ];
then
  echo "You are Jerry!"
else
    echo "You are not John/Jerry!"
fi
```
