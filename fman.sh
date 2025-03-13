#!/bin/bash

# Function to display the menu
show_menu() {
    echo "Choose an option:"
    echo "1. View files in the directory"
    echo "2. Create a file"
    echo "3. Delete a file"
    echo "4. Edit a file"
    echo "5. Search for a file"
    echo "6. Find files containing specific text"
    echo "7. Exit"
}

# Function to view files
view_files() {
    echo "Files in the directory:"
    ls -l
}

# Function to create a file
create_file() {
    read -p "Enter the name of the file to create (or type 'exit' to quit): " filename
    if [[ "$filename" == "exit" ]]; then
        exit 0
    fi
    touch "$filename" && echo "File '$filename' created."
}

# Function to delete a file
delete_file() {
    read -p "Enter the name of the file to delete (or type 'exit' to quit): " filename
    if [[ "$filename" == "exit" ]]; then
        exit 0
    fi
    if [ -e "$filename" ]; then
        rm "$filename" && echo "File '$filename' deleted."
    else
        echo "File '$filename' does not exist."
    fi
}

# Function to edit a file
edit_file() {
    read -p "Enter the name of the file to edit (or type 'exit' to quit): " filename
    if [[ "$filename" == "exit" ]]; then
        exit 0
    fi
    if [ -e "$filename" ]; then
        read -p "Which editor do you want to use? (nano/vim or type 'exit' to quit): " editor
        if [[ "$editor" == "exit" ]]; then
            exit 0
        fi
        case $editor in
            nano)
                nano "$filename" &
                ;;
            vim)
                vim "$filename" &
                ;;
            *)
                echo "Invalid editor. Please choose 'nano' or 'vim'."
                ;;
        esac
    else
        echo "File '$filename' does not exist."
    fi
}

# Function to search for a file
search_file() {
    read -p "Enter the name of the file to search for (or type 'exit' to quit): " filename
    if [[ "$filename" == "exit" ]]; then
        exit 0
    fi
    echo "Searching for '$filename'..."
    results=$(find . -name "$filename" 2>/dev/null)
    if [[ -z "$results" ]]; then
        echo "No files found with the name '$filename'."
    else
        echo "Files found:"
        echo "$results" | nl  # Display results with line numbers
    fi
}

# Function to find files containing specific text
find_files_with_text() {
    if [ -z "$1" ]; then
        echo "No search text provided. Please provide text to search for."
        return
    fi
    echo "Searching for files containing the text: '$1'..."
    results=$(grep -rl "$1" . 2>/dev/null)
    if [[ -z "$results" ]]; then
        echo "No files found containing the text '$1'."
    else
        echo "Files containing the text '$1':"
        echo "$results" | nl  # Display results with line numbers
    fi
}

# Main script execution
if [ $# -gt 0 ]; then
    search_text="$1"
else
    search_text=""
fi

echo "Welcome to the Simple CLI File Manager"
read -p "Enter the directory you want to manage (or type 'exit' to quit): " dir
if [[ "$dir" == "exit" ]]; then
    exit 0
fi

# Change to the specified directory
if cd "$dir"; then
    while true; do
        show_menu
        read -p "Select an option (1-7 or type 'exit' to quit): " option
        if [[ "$option" == "exit" ]]; then
            exit 0
        fi
        case $option in
            1)
                view_files
                ;;
            2)
                create_file
                ;;
            3)
                delete_file
                ;;
            4)
                edit_file
                ;;
            5)
                search_file
                ;;
            6)
                find_files_with_text "$search_text"
                 ;;
            7)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid option. Please select a number between 1 and 7."
                ;;
        esac
        echo ""
    done
else
    echo "Directory '$dir' does not exist."
    exit 1
fi
