## What is Logical volume?
A logical volume in Linux is a virtualized storage entity created by combining multiple physical or logical partitions, providing a flexible and resizable storage space that can be managed dynamically to meet changing storage requirements.

#### The hierarchy to logical volume
Physical Partition(with Linux LVM Type) **->** Physical Volume(pv) **->** Volume Group(vg) **->** Logical Volume(lv)

#### Step 1 - Create a disk partition
**Syntax :** fdisk `</dev/sda>`
```
ubuntu@sep2023:~$ sudo fdisk /dev/sda                                                             ## Enter to the targeted harddisk
Command (m for help): n                                                                           ## Type n for create new partition
Partition number (6-128, default 6):                                                              ## Select partion number, the default is next number of the last created partition
First sector (31870976-41943006, default 31870976):                                               ## default is recommended
Last sector, +/-sectors or +/-size{K,M,G,T,P} (31870976-41943006, default 41943006): +250M        ## Enter the targeted partition size in K,M,G,T,P
Command (m for help): t                                                                           ## Change partition type to Linux LVM
Partition number (1-6, default is 6):                                                             ##  Enter the number of the  partition you created
Partition type  or alias (L to list all): 30                                                      ## Linux LVM type is 30 in GPT based
Command (m for help): w                                                                           ## Write the changes
ubuntu@sep2023:~$
```
#### Step 2 - Convert to physical volume
**Syntax:**  pvcreate <partition>                                                                 ## The absolute path of the partition
```
ubuntu@sep2023:~$ sudo pvs                                                                        ## List physical volumes (pv display is an alternative)
ubuntu@sep2023:~$ sudo pvcreate /dev/sda6
```
#### Step 3 - Cretae Volume group
