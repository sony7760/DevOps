## Questions and Answers

### 1. **Difference between `git reset`, `git revert`, and `git checkout`:**
- **`git reset`**: Moves the HEAD and optionally modifies the index or working directory (undo commits).  
- **`git revert`**: Creates a new commit to undo changes made by a previous commit.  
- **`git checkout`**: Switches branches or restores files in the working directory.

---

### 2. **Difference between `git pull` and `git fetch`:**
- **`git fetch`**: Retrieves updates from the remote but does not merge them.  
- **`git pull`**: Retrieves updates and automatically merges them into the current branch.

---

### 3. **Rename an existing branch:**
Use the command:  
```bash
git branch -m <old_branch_name> <new_branch_name>
```

---

### 4. **Handling merge conflicts in Git:**
1. Identify conflicts using `git status`.  
2. Manually resolve conflicts in files.  
3. Stage the resolved files using `git add`.  
4. Complete the merge with `git commit`.

---

### 5. **Detached HEAD state:**
- Occurs when HEAD points directly to a commit instead of a branch.  
- Fix it by checking out a branch:  
  ```bash
  git checkout <branch_name>
  ```

---

### 6. **Stash changes and apply to another branch:**
- **Stash changes**:  
  ```bash
  git stash
  ```  
- **Switch to another branch and apply the stash**:  
  ```bash
  git checkout <branch_name>
  git stash apply
  ```

---

### 7. **Difference between `git merge` and `git rebase`:**
- **`git merge`**: Combines changes from one branch into another, creating a merge commit.  
- **`git rebase`**: Reapplies commits on top of another base, creating a linear history.

---

### 8. **Use of `git cherry-pick`:**
- Applies a specific commit from another branch to the current branch:  
  ```bash
  git cherry-pick <commit_hash>
  ```

---

### 9. **Undo the last commit but keep changes:**
```bash
git reset --soft HEAD~1
```

---

### 10. **List all branches (local and remote):**
```bash
git branch -a
```

---

### 11. **Git tag vs. branch:**
- **Tag**: A pointer to a specific commit, often used for versioning.  
- **Branch**: A movable pointer to commits that changes as you add new commits.

---

### 12. **Compare two commits:**
```bash
git diff <commit1> <commit2>
```

---

### 13. **Purpose of `.gitkeep`:**
- Used to keep an empty directory tracked in Git since Git does not track empty directories.

---

### 14. **Remove a file from Git without deleting it locally:**
```bash
git rm --cached <file_name>
```

---

### 15. **Squash multiple commits into one:**
- Use interactive rebase:  
  ```bash
  git rebase -i HEAD~<number_of_commits>
  ```  
- Mark commits as `squash` or `fixup`.

---

### 16. **See who modified a line in a file and when:**
```bash
git blame <file_name>
```

---

### 17. **Clone only a specific branch:**
```bash
git clone -b <branch_name> --single-branch <repository_url>
```

---

### 18. **Difference between `git archive` and `git bundle`:**
- **`git archive`**: Creates a compressed archive (e.g., .zip, .tar) of the repository files.  
- **`git bundle`**: Packages an entire Git repository (including history) into a single file.

---

### 19. **Delete a remote branch:**
```bash
git push origin --delete <branch_name>
```

---

### 20. **Difference between `git diff HEAD` and `git diff --cached`:**
- **`git diff HEAD`**: Shows changes between the working directory and the last commit.  
- **`git diff --cached`**: Shows changes between the staging area and the last commit.

---
