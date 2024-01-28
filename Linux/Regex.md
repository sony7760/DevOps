## Regular Expressions(Regex)
- Regular expressions (regex or regexp) in Linux are powerful patterns that define text strings. They are widely used in commands and utilities for searching, matching, and manipulating text. 
- Regular expressions are special characters or sets of characters that help us to search for data and match the complex pattern.
![](./images/Regex.png)

#### Samples
- **Basic Search:**
  - **`'pattern' filename`**                       ## Searches for the pattern in a file
- **Wildcard Characters:**
  - **`.`**                                             ## Matches any single character
  - **`.*`**                                            ## Matches any sequence of characters
- **Character Classes:**
  - **`[0-9]`**                                         ## Matches any digit
  - **`[a-zA-Z]`**                                      ## Matches any uppercase or lowercase letter
  - **`[^0-9]`**                                        ## Matches any non-digit
- **Anchors:**
  - **`^pattern`**                                      ## Matches lines that start with the pattern
  - **`pattern$`**                                      ## Matches lines that end with the pattern
- **Quantifiers:**
  - **`a*`**                                            ## Matches 'a', 'aa', 'aaa', etc
  - **`a+`**                                            ## Matches 'a', 'aa', 'aaa', etc., but not an empty string
  - **`a?`**                                            ## Matches 'a' or an empty string
- **Escape Characters:**
  - **`\.`**                                            ## Matches a literal period

#### Utilities Using Regular Expressions
- **grep:**
  - grep is an essential command for text processing and searching in the Linux command line. The name "grep" stands for "Global Regular Expression Print"
  - Syntax: **`grep 'pattern' file.txt`**
  - Examples:
    ```
    root@myhost~#grep 'root' /etc/passwd                ## Search for a Pattern in a File
    root@myhost~#grep -i "ROOT" /etc/passwd             ## Case-Insensitive Search
    root@myhost~#grep -v "root" /etc/passwd             ## Invert the Match (Show Non-Matching Lines)
    root@myhost~#grep -c "root" /etc/passwd             ## Count the Number of Matching Lines
    root@myhost~#grep -n "root" /etc/passwd             ## Display Line Numbers with Matching Lines
    root@myhost~#grep -w "root" /etc/passwd             ## Search for Whole Words
    root@myhost~#grep -r "root" /etc/                   ## Recursive Search in Subdirectories
    root@myhost~#grep -l "root" /etc/*                  ## Display Only File Names with Matching Lines
    root@myhost~#grep -E "root|daemon" /etc/passwd      ## Extended grep operations
    root@myhost~#grep -B 2 "root" /etc/passwd           ## Display 2 lines before the match
    root@myhost~#grep -A 3 "root" /etc/passwd           ## Display 3 lines after the match
    root@myhost~#grep -C 2 "root" /etc/passwd           ## Display 2 lines before and after the match
    ```
- **sed:**
  - The name "sed" stands for "stream editor". The sed command in Linux is a stream editor used for filtering and transforming text. It is particularly powerful for making changes to a text stream or a file non-interactively
  - Syntax: **`sed [options] 'command' filename`**
  - Options:
    - `-e:` Allows specifying multiple editing commands
    - `-i:` Edit files in-place (i.e., save changes to the original file).
  - Examples:
    ```
    root@myhost~#sed 's/root/ROOT/' /etc/passwd         ## Substitute (s): Replaces the first occurrence of "old" with "new" on each line
    root@myhost~#sed 's/root/ROOT/g' /etc/passwd        ## Global Substitute (g flag): Replaces all occurrences of "old" with "new" on each line
    root@myhost~#sed '1s/root/jerry/' /etc/passwd       ## Substitute with Line Numbers: Replaces the first occurrence of "old" with "new" on line 1
    root@myhost~#sed -e 's/root/ROOT/' -e 's/sys/SYSTEM/' /etc/passwd ## Multiple Commands: Allows applying multiple commands`
    root@myhost~#sed -n '2,5p' /etc/passwd              ## Print Specific Lines: Prints lines 2 to 5
    root@myhost~#sed -n '0~2p' /etc/passwd              ## Print Every Nth Line: Prints every 2nd line
    root@myhost~#sed '2d' /etc/passwd                   ## Delete Lines: Deletes line 2
    root@myhost~#sed -n '/root/p' /etc/passwd           ## Print Only Matching Lines: Prints lines containing the pattern
    root@myhost~#sed -n '/root/!p' /etc/passwd          ## Print Lines Not Matching: Prints lines not containing the pattern
    root@myhost~#sed '/^$/d' /etc/passwd                ## Delete Empty Lines
    root@myhost~#echo "hello" | sed 'y/abcdef/ABCDEF/'  ## Translate (Replace Characters): Outputs "hEllo"
    root@myhost~#sed 's/[0-9][0-9]/XX/' /etc/passwd     ## This command replaces two consecutive digits with "XX."
    ```
- **awk:**
  - Text processing tool with powerful pattern matching
  - Example: **`awk '/pattern/ {print $1}' file.txt`**
- **find:**
  - Searches for files in a directory hierarchy
  - Example: **`find . -name '*.txt'`**
- **egrep or grep -E:**
  - Supports extended regular expressions with additional metacharacters
  - Example: **`egrep 'pattern1|pattern2' file.txt`**
- **vi and vim:**
  - Text editors that support regex for searching and text manipulation
