## What is Logical volume?
A logical volume in Linux is a virtualized storage entity created by combining multiple physical or logical partitions, providing a flexible and resizable storage space that can be managed dynamically to meet changing storage requirements.

![](./images/lvm.png)
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
**Syntax:**  pvcreate `<partition>`                                                               ## The absolute path of the partition
```
ubuntu@sep2023:~$ sudo pvs                                                                        ## List physical volumes (pv display is an alternative)
ubuntu@sep2023:~$ sudo pvcreate /dev/sda6
ubuntu@sep2023:~$ sudo pvs
```
#### Step 3 - Cretae Volume group
**Syntax:**  vgcreate `<vg name>` `<physical volume>`                                            ## ## The absolute path of the pv
```
ubuntu@sep2023:~$ sudo vgs
ubuntu@sep2023:~$ sudo vgcreate orange-vg /dev/sda6
ubuntu@sep2023:~$ sudo vgs
```
#### Step 3 - Cretae Logical Volume (LVM)
**Syntax:**  lvcreate -L `+<size>` -n `<lv name>` `<vg name>`
```
ubuntu@sep2023:~$ sudo lvs
ubuntu@sep2023:~$ sudo lvcreate apple-lvm /dev/sda6
ubuntu@sep2023:~$ sudo lvs
```
#### Step 4 - Format logical volume
**Syntax:** mkfs -t `<FileSystem>` `<lvm name>`                                                 ## Choose appropriate FileSystem
```
ubuntu@sep2023:~$ sudo mkfs -t ext4 /dev/orange-vg/apple-lvm
```
#### Step 5 - Mount logical volume
**Syntax:** `<absolute lvm path OR UUID>`  `<mountpoint>`  `<filesystem>` `<options>` `<enable/disable dump>` `<enable/disable fsck>` ## Permanent Mount, which will persist after rebbot
```
ubuntu@sep2023:~$ sudo mkdir -p /orange/custom_lvm/apple                                         ## Create a mount point(directory)
ubuntu@sep2023:~$ sudo vim  /etc/fstab
/dev/orange-vg/apple-lvm /orange/custom_lvm/apple ext4 defaults  0 0                             ## Write and quit(:wq) from vim editor
ubuntu@sep2023:~$ sudo mount -a                                                                  ## Mount all devices in the fstab
ubuntu@sep2023:~$ df -h
```

**_Note:_** vgextend and lvextend are the commands if you want to extend the size of each.
