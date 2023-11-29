## What is Disk partitions?
Disk partitions are divisions of a physical storage device, allowing users to organize and manage data by creating separate sections on a disk, each with its own file system.
## Difference between low level format and high level format in Disk partition?
Low-level formatting is the process of creating physical tracks and sectors on a disk, while high-level formatting involves setting up the file system and necessary data structures for organizing and storing files on a partition.
## How to create, format and mount a Linux partition?
#### creating a new 250M partition in the disk /dev/sda
**Syntax :** fdisk `</dev/sda>`
```
ubuntu@sep2023:~$ sudo fdisk /dev/sda                                                             ## Enter to the targeted harddisk
Command (m for help): n                                                                           ## Type n for create new partition
Partition number (6-128, default 6):                                                              ## Select partion number, the default is next number of the last created partition
First sector (31870976-41943006, default 31870976):                                               ## default is recommended
Last sector, +/-sectors or +/-size{K,M,G,T,P} (31870976-41943006, default 41943006): +250M        ## Enter the targeted partition size in K,M,G,T,P
Command (m for help): w                                                                           ## Write the changes
ubuntu@sep2023:~$
```
#### Format the newly created partition /dev/sda6
Formatting a Linux partition is done to prepare the storage space for use by creating a file system, allowing the operating system to organize and store data in a structured manner, and it is typically performed during initial setup or when reconfiguring the partition for reuse. Linux filesystems are ext, ext2, ext3, ext4, xfs etc ...

**Syntax:** mkfs -type `<File System>` `<Partition>`
```
ubuntu@sep2023:~$ mkfs -t ext4 /dev/sda6                                                          ## Here it formating with the ext4 filesystem
```
#### Mount partition
Mounting a Linux partition is the process of attaching the partition to a specific directory in the file system, enabling the operating system/users to access and use the data stored on that partition.

**Syntax 1:** mount `<partition>` `<mount point>`                                                ## Temporary Mount
```
ubuntu@sep2023:~$ mkdir /myfirstpart                                                             ## Create a directory(Mount point)
ubuntu@sep2023:~$ mount /dev/sda6 /myfirstpart                                                   ## Mount partition to the targeted directory. umount comman can be used to unmount it
ubuntu@sep2023:~$ df -h                                                                          ## To list all mounted filesystems
```
**Syntax 2:** `<device>`  `<mountpoint>`  `<filesystem>` `<options>` `<dump>` `<fsck>`           ## Permanent Mount, which will persist after rebbot
```
ubuntu@sep2023:~$ sudo vim  /etc/fstab
/dev/sda6 /myfirstpart ext4 defaults  0 0                                                        ## Write and quit(:wq) from vim editor
ubuntu@sep2023:~$ sudo mount -a                                                                  ## Mount all devices in the fstab
ubuntu@sep2023:~$ df -h
```
