## Git
Git is a distributed version control system (DVCS) that is widely used for tracking changes in source code during software development. It allows multiple developers to collaborate on a project, keeping track of their changes and managing the project's source code history. Developed by Linus Torvalds in 2005, Git has become one of the most popular version control systems in the world.

Here are some key concepts and features of Git:
- **Distributed Version Control:** Unlike centralized version control systems (CVCS), Git is distributed, meaning that each developer has a complete copy of the repository, including its full history. This decentralization enhances collaboration and allows developers to work offline.
- **Remote Repositories:** As mentioned above, the developers can clone a repository from a remote server, fetch changes from the remote server, and push their changes back to the remote server.
- **Commit:** In Git, the developers make changes to the code, and these changes are saved as commits. Each commit has a unique identifier, and Git maintains a chronological history of these commits.
- **Branching:** Developers can create branches to work on new features or bug fixes without affecting the main codebase. Branches can be merged back into the main branch (usually master or main) once the changes are tested and ready.
- **Merging:** Git allows developers to merge changes from one branch into another. Merging is a way to integrate changes made in separate branches back into the main codebase.
- **Pull:** The command is used to fetch and integrate changes from a remote repository into your current branch. It's a combination of two commands: **git fetch** and **git merge**. This command is often used when you want to update your local repository with changes made in the remote by others.
- **Push:** The command is used to upload your local changes to a remote repository. It is used when you want to share your work with others or update a remote branch with your local changes.
- **Conflict Resolution:** When multiple developers make changes to the same part of the code simultaneously, Git helps in detecting and resolving conflicts. Developers can manually resolve conflicts during the merging process.

## Setup Git
### Server(192.168.56.10)
make sure we have a clean installation of Ubuntu <version> LTS.

The first step is to install Git on your Ubuntu server(by default git is installed). 
```
root@node1~#apt-get update
root@node1~#apt-get install git
root@node1~#git –version
```
Create a Git Users. It can be used any username and the users must have shell access provided.
```
root@node1~#useradd -m -c "Git user1" -s /bin/bash git
root@node1~#passwd git
```
Create a common directory. It can be used for creating many repositories.
```
root@node1~#mkdir /scm
```
Change the ownership of the directory to the git user.
```
root@node1~#chown git:git /scm
```
Initialize a new bare repository.
```
root@node1~#su - git
git@node1~$cd /scm
git@node1~$mkdir firstrepo
git@node1~$git init
```
### Client
In windows, git bash can be used as client. In Linux, the terminal is suitable.

Clone git repository locally.
```
jerry@local~$git clone git@192.168.56.10:/scm/firstrepo                          # Create a local copy which enable you work offline
jerry@local~$cd firstrepo

```
