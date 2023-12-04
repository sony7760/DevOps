## User and Group Administration in Linux
User and group administration in Linux involves managing user accounts, groups, and their associated permissions.

#### Key Files and Directories:
- **/etc/passwd:**
  - Contains user account information.
- **/etc/shadow:**
  - Stores encrypted user passwords.
- **/etc/group:**
  - Contains group information.
- **/etc/sudoers:**
  - Configures sudo access.

**_Here are key commands and concepts for user and group administration:_**

#### User Administration:
**Creating a User:**
- Use the -m option to create the user's home directory.
- useradd -h OR useradd --help OR man useradd for more details
```
root@sep2023:~#useradd jerry                                             ## Add user  jerry
```
**Setting Password:**
- Allows you to set or change the user's password.
```
root@sep2023:~#passwd jerry                                              ## Set password for user jerry. Just `passwd` command will change password of current user
```
**Deleting a User:**
- Removes a user. Use the -r option to also delete the home directory.
- userdel -h OR userdel --help OR man userdel for more details
```
root@sep2023:~#userdel jerry                                             ## Delete user jerry
```
**Modifying User Properties:**
- Options include `-aG` (add user to group), `-g` (change primary group), `-d` (change home directory), etc.
- usermod -h OR usermod --help OR man usermod for more details
```
root@sep2023:~#usermod [options] username
root@sep2023:~#usermod -c "Account manager" jerry                        ## Set a comment for user jerry
```
**Manage user's account/password aging:**
- The chage command is used to view and change the user's account/password aging information.
- chage -h OR chage --help OR man chage for more details
```
root@sep2023:~#chage -l jerry                                            ## List all aging information of user jerry
root@sep2023:~#chage -d 2023-12-31 jerry                                 ## To set the last passwordchange date to specified date
root@sep2023:~#chage -E 2024-12-31 jerry                                 ## To specify the date when the account should expire
root@sep2023:~#chage -M 7 jerry                                          ## To specify the maximum(-M) and minimum(-m) number of days between password change
```
**Viewing User Information:**
- Displays information about a user, including user and group IDs.
- id -h OR id --help OR man id for more details
```
root@sep2023:~#id jerry
```
**Switching User:**
- Switches to another user and environment.
- su -h OR su --help OR man su for more details
```
root@sep2023:~#su - jerry                                               ## It migh need jerry's password when attempt from a non root user
```
#### Group Administration:
**Creating a Group:**
- groupadd -h OR groupadd --help OR man groupadd for more details
```
root@sep2023:~#groupadd orange                                         ## Create a new group
```
**Adding a User to a Group:**
```
root@sep2023:~#usermod -aG orange ubuntu                               ## Set ubuntu's secondar group as orange
```
**Changing a User's Primary Group:**
```
root@sep2023:~#usermod -g orange jerry                                 ## Change jerry's primary group to orange
```
**Deleting a Group:**
- groupdel -h OR groupdel --help OR man groupdel for more details
```
root@sep2023:~#groupdel orange
```
#### Permissions and Ownership:
**Changing Ownership:**
- Changes the owner and group of a file or directory
- chgrp command can be used for change group specific ownership
```
root@sep2023:~#mkdir -p /orange/red
root@sep2023:~#touch /orange/red/helloworld.txt
root@sep2023:~#chown jerry:orange /orange/red/helloworld.txt         ## Change user ownership and group ownership together to user jerry and group orange respectievely
root@sep2023:~#ls -l /orange/red/helloworld.txt                      ## Long list permission of file 
```
