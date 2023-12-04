## File Permissions
File permissions in Linux determine who can access a file or directory and what actions they can perform. Permissions are set for three categories of users: the file owner, the group owner, and others (everyone else, it might be users/groups). There are three types of actions that can be allowed or denied: reading, writing, and executing.

### Types of Permissions:
**Read (r):**
- For files: Allows the reading of the file's content.
- For directories: Allows listing the contents of the directory.

**Write (w):**
- For files: Allows modifying the file, including writing new data to it.
- For directories: Allows creating, deleting, or renaming files within the directory.

**Execute (x):**
- For files: Allows the execution of the file if it is a program or script.
- For directories: Allows accessing the directory and its contents.

#### Symbolic Notation:
Permissions are represented using a symbolic notation where each category (user, group, others) has a set of three characters,
- **r** for read, **w** for write, **x** for execute.
- The order is always **rwx**, and an absence of permission is represented by a **-**.
- Example: **rw-r--r--** means the file owner has read and write permissions, but others can only read.

#### Numeric Notation:
Each permission can be represented by a numeric value,
- Read (**r**) is **4**,
- Write (**w**) is **2**,
- Execute (**x**) is **1**
- For example, **rw-r--r--** in numeric notation is **644**

#### Commands for Managing Permissions:
**Syntax:** chmod `<permissions>` `<file or directory>` 
```
ubuntu@sep2023:~$ls -l                                               ## To list(long list) permissions of files in a directory
ubuntu@sep2023:~$ls -ld                                              ## To list permissions of a specific directory
ubuntu@sep2023:~$chmod u+x /orange/mango.txt                         ## To set execution permission for owner of the file
ubuntu@sep2023:~$chmod g+r /orange/mango.txt                         ## To set read permission for group of the file
ubuntu@sep2023:~$chmod o-x /orange/mango.txt                         ## To remove execution permisson for others in the system
ubuntu@sep2023:~$chmod 740 /orange/mango.txt                         ## To set rwx for owner, r for group and no permisssion for others
```
