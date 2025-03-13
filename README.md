```markdown
# Simple CLI File Manager

## Overview

The Simple CLI File Manager is a shell script that provides a command-line interface for managing files and directories. It allows users to perform various file operations such as viewing, creating, deleting, editing, searching for files, and finding files containing specific text. This tool is designed for users who prefer a lightweight and straightforward way to manage files directly from the terminal.

## Features

- **View Files**: List all files in the current directory.
- **Create File**: Create a new file with a specified name.
- **Delete File**: Remove a file by name.
- **Edit File**: Open a file in a text editor (supports `nano` and `vim`).
- **Search for File**: Search for a file by name in the current directory and its subdirectories.
- **Find Files Containing Text**: Search for files that contain a specific text string (passed as an argument when executing the script).
- **Exit**: Exit the program gracefully.

## Requirements

- A Unix-like operating system (Linux, macOS, etc.)
- Bash shell
- `nano` or `vim` text editor (for editing files)
- Basic command-line knowledge

## Installation

1. **Clone the repository** (if applicable) or download the script file.
2. **Make the script executable**:
   ```bash
   chmod +x file_manager.sh
   ```

## Usage

1. **Run the script**:
   ```bash
   ./file_manager.sh
   ```

2. **Select a directory**: When prompted, enter the path of the directory you want to manage. You can type `exit` at any prompt to quit the program.

3. **Choose an option**: The menu will display several options. Enter the number corresponding to the desired action.

4. **Find files containing specific text**: You can also pass a text string as an argument when executing the script:
   ```bash
   ./file_manager.sh "search_text"
   ```

   This will allow you to find files containing the specified text in the current directory and its subdirectories.

## Example

```bash
$ ./file_manager.sh
Welcome to the Simple CLI File Manager
Enter the directory you want to manage (or type 'exit' to quit): /path/to/directory
Choose an option:
1. View files in the directory
2. Create a file
3. Delete a file
4. Edit a file
5. Search for a file
6. Find files containing specific text
7. Exit
Select an option (1-7 or type 'exit' to quit): 1
Files in the directory:
total 0
-rw-r--r-- 1 user user 0 Oct  1 12:00 example.txt
```

## Notes

- Ensure you have the necessary permissions to create, delete, and edit files in the specified directory.
- The script uses the `find` and `grep` commands, which are standard utilities in Unix-like systems.

## License

This project is licensed under the BSD 2-Clause License. See the [LICENSE](LICENSE) file for details.
