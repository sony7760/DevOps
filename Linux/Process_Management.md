## What is process?
A process is an instance of a program in execution. Process management in Linux involves the creation, scheduling, and termination of processes. Linux provides a robust set of tools and mechanisms for managing them.
### Process Creation:
- **Running a Command:**
  - When you execute a command in the terminal, the shell creates a new process to run that command.
- **Forking:**
  - A process can create a new process using the fork() system call. The new process is called the child, and the original process is the parent.
- **Executing a Program:**
  - After forking, a process can replace its image with a new program using the exec() system call.

_**Reference:**_ https://www.javatpoint.com/fork-vs-exec
### Process Identification:
- **Process ID (PID):**
  - Each process is identified by a unique numerical identifier called the Process ID (PID).
    ```
    root@node1~#pidof apache2
    ```
- **Parent Process ID (PPID):**
  - The PPID is the PID of the parent process that spawned the current process.
### Viewing Processes:
- **`ps` Command:**
  - Displays information about currently running processes.
  - Example: `ps aux` OR `ps -ef` shows detailed information about all processes.
- **`top` Command:**
  - Provides a dynamic, real-time view of system processes.
  - Interactive and continuously updates information.
- **`htop` Command:**
  - An enhanced version of `top` with a more user-friendly interface.
### Signal Handling:
- **Signals:**
  - Processes can communicate with each other using signals.
  - Common signals include SIGKILL (terminate), SIGTERM (terminate gracefully), and SIGINT (interrupt).
- **`kill` Command:**
  - Sends signals to processes.
  - Example: `kill -9 PID` sends a `SIGKILL` signal to terminate a process.
    ```
    root@node1~#kill -9 1734
    ```

_**Reference:**_  https://faculty.cs.niu.edu/~hutchins/csci480/signals.htm
### Background and Foreground Execution:
- **Background Execution:**
  - Adding `&` at the end of a command runs it in the background.
    ```
    root@node1~#sleep 60&
    ```
- **Foreground Execution:**
  - Processes running in the foreground interact with the user and can receive signals like Ctrl+C for termination.
    ```
    root@node1~#sleep 60
    ```
### Process States:
- **Running (R), Sleeping (S), Stopped (T), Zombie (Z):**
  - Processes go through various states during their lifecycle.
  - Zombie processes are terminated but still have an entry in the process table.
