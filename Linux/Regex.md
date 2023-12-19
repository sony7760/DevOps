## Regular Expressions(Regex)
- Regular expressions (regex or regexp) in Linux are powerful patterns that define text strings. They are widely used in commands and utilities for searching, matching, and manipulating text. 
- Regular expressions are special characters or sets of characters that help us to search for data and match the complex pattern.
![](./images/Regex.png)

#### Examples
- **Basic Search:**
  - **`grep 'pattern' filename`**                       ## Searches for the pattern in a file
- **Wildcard Characters:**
  - **`.`**                                             ## Matches any single character
  - **`.*`**                                            ## Matches any sequence of characters
- **Character Classes:**
  - **`[0-9]`**                                         ## Matches any digit
  - **`[a-zA-Z]`**                                      ## Matches any uppercase or lowercase letter
  - **`[^0-9]`**                                        ## Matches any non-digit
- **Anchors:**
  - **`^pattern`**                                      ## Matches lines that start with the pattern
  - 
