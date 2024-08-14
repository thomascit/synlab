#!/bin/bash
# Used to copy movie folders to assets folder

# Define the source and destination directories
SOURCE_DIR="/path/to/media/movies"
DEST_DIR="/path/to/appdata/kometa/assets"

# Function to copy empty folders from source to destination
copy_empty_folders() {
    # Find all directories in the source directory
    find "$SOURCE_DIR" -type d | while read -r DIR; do
        # Remove the source directory prefix to get the relative directory path
        RELATIVE_DIR="${DIR#$SOURCE_DIR}"
        # Create the corresponding directory structure in the destination
        mkdir -p "$DEST_DIR/$RELATIVE_DIR"
    done
}

# Function to delete folders in the destination that don't exist in the source and are empty
delete_empty_extra_folders() {
    # Find all directories in the destination directory
    find "$DEST_DIR" -type d | while read -r DEST_DIR_FOLDER; do
        # Remove the destination directory prefix to get the relative directory path
        RELATIVE_DIR="${DEST_DIR_FOLDER#$DEST_DIR}"
        # Check if the corresponding directory exists in the source
        if [ ! -d "$SOURCE_DIR/$RELATIVE_DIR" ]; then
            # Check if the directory is empty
            if [ -z "$(ls -A "$DEST_DIR_FOLDER")" ]; then
                # If it doesn't exist in the source and is empty, delete the directory
                echo "Deleting empty directory $DEST_DIR_FOLDER"
                rmdir "$DEST_DIR_FOLDER"
            fi
        fi
    done
}

# Execute the functions
copy_empty_folders
delete_empty_extra_folders

echo "Operation completed."
