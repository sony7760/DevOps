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
- **Syntax of simple `if`:** if [ condition ]; then _operation_; fi
- **Syntax of `if` - `else`:** if [ condition ]; then _operation-1_; else _operation-2_; fi
- **Syntax of `if` - `elif` - `else` :** if [ condition-1 ]; then _operation-1_; elif [ condition-2 ]; then _operation-2_; else _operation-3_; fi
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
#### Loops:
- Loops are used to repeat commands or a block of code
- **Syntax of `for` loop:** for _decleration_; do _operation_; done
```
## This loop can be used to print line by line with 2 seconds interval each
for lines in $(cat /etc/passwd)
do
  echo "$lines"
  sleep 2
done
```
- **Syntax of `while` loop:** while _decleration_; do _operation_; done
```
## This loop can be used to read lines of a file and print with line number
n=1
while read -r line
do
  echo -e "$n \t$line"
  n=$(expr $n + 1)
done < /etc/passwd                                            ## `<` indicates stdin, `1>` indicates stdout, `2>` indicates stderr
```
#### Functions:
- Functions allow you to organize your code into reusable blocks
- **Syntax of `function`:** function _function_name_ { operations }
```
function greet {
  echo "Hello, $1!"
}

greet $1                                                     ## Reuse the function
```
#### Sourcing:
- Optimize/enhance your script by extending to other scripts
```
ubuntu@sep2023:~$cat << END 1> input.sh
> #!/bin/bash
> USERNAME=jerry
> PASSWORD="123456"
> HOST="192.168.10.100"
> END
ubuntu@sep2023:~$
ubuntu@sep2023:~$chmod u+x inputs.sh
```

```
source /home/ubuntu/scripts/input.sh
mysql -h $HOST -u $USERNAME -p $PASSWORD                    ## This will login to mysql db server 
```
