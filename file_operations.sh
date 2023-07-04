#!/bin/bash

print_menu() {
    echo "========= File Operations ========="
    echo "1. Rename a file"
    echo "2. Remove a file"
    echo "3. Copy a file"
    echo "4. Move a file"
    echo "5. Create a directory"
    echo "6. List files in a directory"
    echo "7. View file contents"
    echo "8. Create an empty file"
    echo "9. Append to a file"
    echo "10. Search for a file"
    echo "11. Compress a file or directory"
    echo "12. Extract a compressed file"
    echo "13. Display file information"
    echo "14. Change file permissions"
    echo "15. Exit"
    echo "==================================="
}

rename_file() {
    echo "Enter the current file name: "
    read current_name
    echo "Enter the new file name: "
    read new_name

    if [ -e "$current_name" ]; then
        mv "$current_name" "$new_name"
        echo "File renamed successfully!"
    else
        echo "Error: File not found."
    fi
}

remove_file() {
    echo "Enter the file name you want to remove: "
    read file_name

    if [ -e "$file_name" ]; then
        rm "$file_name"
        echo "File removed successfully!"
    else
        echo "Error: File not found."
    fi
}

copy_file() {
    echo "Enter the source file name: "
    read source_file
    echo "Enter the destination file name: "
    read destination_file

    if [ -e "$source_file" ]; then
        cp "$source_file" "$destination_file"
        echo "File copied successfully!"
    else
        echo "Error: Source file not found."
    fi
}

move_file() {
    echo "Enter the file name you want to move: "
    read file_name
    echo "Enter the destination directory: "
    read destination_dir

    if [ -e "$file_name" ]; then
        mv "$file_name" "$destination_dir"
        echo "File moved successfully!"
    else
        echo "Error: File not found."
    fi
}

create_directory() {
    echo "Enter the name of the new directory: "
    read dir_name

    mkdir "$dir_name"
    echo "Directory created successfully!"
}

list_files() {
    echo "Enter the directory path (press Enter for current directory): "
    read dir_path

    if [ -z "$dir_path" ]; then
        dir_path="."
    fi

    if [ -d "$dir_path" ]; then
        ls -l "$dir_path"
    else
        echo "Error: Directory not found."
    fi
}

view_file_contents() {
    echo "Enter the file name to view its contents: "
    read file_name

    if [ -e "$file_name" ]; then
        cat "$file_name"
    else
        echo "Error: File not found."
    fi
}

create_empty_file() {
    echo "Enter the name of the new empty file: "
    read file_name

    touch "$file_name"
    echo "Empty file created successfully!"
}

append_to_file() {
    echo "Enter the file name to append data: "
    read file_name

    if [ -e "$file_name" ]; then
        echo "Enter the content to append (press Ctrl + D when done): "
        cat >> "$file_name"
        echo "Data appended to file."
    else
        echo "Error: File not found."
    fi
}

search_file() {
    echo "Enter the file name or pattern to search: "
    read file_pattern

    echo "Search results:"
    find . -type f -name "$file_pattern"
}

compress_file() {
    echo "Enter the file or directory name to compress: "
    read source_file

    if [ -e "$source_file" ]; then
        tar -czvf "$source_file.tar.gz" "$source_file"
        echo "File or directory compressed successfully!"
    else
        echo "Error: File or directory not found."
    fi
}

extract_file() {
    echo "Enter the compressed file name: "
    read compressed_file

    if [ -e "$compressed_file" ]; then
        tar -xzvf "$compressed_file"
        echo "File extracted successfully!"
    else
        echo "Error: Compressed file not found."
    fi
}

display_file_info() {
    echo "Enter the file name: "
    read file_name

    if [ -e "$file_name" ]; then
        ls -l "$file_name"
    else
        echo "Error: File not found."
    fi
}

change_file_permissions() {
    echo "Enter the file name: "
    read file_name

    if [ -e "$file_name" ]; then
        echo "Enter the new permissions (e.g., 755): "
        read permissions

        chmod "$permissions" "$file_name"
        echo "File permissions changed successfully!"
    else
        echo "Error: File not found."
    fi
}

while true; do
    print_menu

    read -p "Enter your choice: " choice

    case "$choice" in
        1) rename_file;;
        2) remove_file;;
        3) copy_file;;
        4) move_file;;
        5) create_directory;;
        6) list_files;;
        7) view_file_contents;;
        8) create_empty_file;;
        9) append_to_file;;
        10) search_file;;
        11) compress_file;;
        12) extract_file;;
        13) display_file_info;;
        14) change_file_permissions;;
        15) echo "Goodbye!"; exit;;
        *) echo "Invalid choice. Please try again.";;
    esac

    echo ""
done
