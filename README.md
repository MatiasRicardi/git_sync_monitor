# Git Sync Monitor

This Bash script allows you to monitor and automatically synchronize multiple applications or Git repositories. 
It checks if the local commit matches the remote commit (on the current branch) and, if not, performs a `git pull` (or whatever you want) to keep the applications up-to-date.

## Features

- Monitors multiple applications/repositories.
- Checks if the local commit is in sync with the remote commit.
- Automatically updates out-of-date repositories.
- Logs activity with timestamps.
- Repeats the process every minute (configurable).

## Requirements

- Linux/Unix with Bash installed.
- Access to the configured Git repositories (credentials if required).
- Read/write permissions on the application directories.

## Setup

1. **Define the root path for your applications**  
   Modify the `root_path` variable in the script to point to the directory containing your applications:

   ```bash
   root_path="/home/apps/"
   ```

2. **List the applications/repositories**  
   Add the directory names of your applications to the `apps` list:

   ```bash
   apps=("app1" "app2" "app3")
   ```

3. **Grant execute permissions**  
   Ensure the script is executable:

   ```bash
   chmod +x git_sync_monitor.sh
   ```

4. **Run the script**  
   Execute the script:

   ```bash
   ./git_sync_monitor.sh
   ```

## Script Workflow

1. **Configuration Variables**  
   - `root_path`: Base path where applications are located.
   - `apps`: List of directory names of the applications.

2. **Main Flow**  
   - Iterates over the list of applications.
   - Checks the local and remote commits.
   - Runs a `git pull` if the commits do not match.
   - Waits one minute before repeating.

3. **Logging**  
   - Logs every action with a timestamp, including:
     - Sync status.
     - Local and remote commit hashes.
     - Repository updates.

## Example Output

```plaintext
2024-11-20 14:00:00 - running script..
2024-11-20 14:00:00 - checking app /home/apps/app1
2024-11-20 14:00:00 - local hash a1b2c3d4
2024-11-20 14:00:01 - origin hash a1b2c3d4
2024-11-20 14:00:01 - app /home/apps/app1 is up to date
2024-11-20 14:00:01 - sleeping...
```

## Customization

- **Execution Frequency**  
  Change the wait time between iterations by modifying the line:

  ```bash
  sleep 60s
  ```

  For example, to wait 5 minutes:

  ```bash
  sleep 300s
  ```

- **Update Command**  
  If you need to run additional commands after `git pull`, add them in the corresponding section of the script.

## Use Responsibly

Ensure your local changes are committed before running this script, as a `git pull` might cause conflicts if there are differences between the local and remote repositories.

## License

This project is licensed under the [MIT License](LICENSE).

---

Contributions and improvements are welcome!
