#!/bin/bash

# Function to sync file
sync_file() {
	local file_name=$1
	local source_path="./$file_name"
	local target_path="$HOME/$file_name"

	# Check if the source file exists
	if [ ! -f "$source_path" ]; then
		echo "Source $file_name does not exist in the current directory."
		return
	fi

	# Check if the target file exists
	if [ -f "$target_path" ]; then
		echo "$file_name exists in both the current directory and your home directory."
		echo "Select an option:"
		echo "1) Overwrite the local copy with the file from the repo."
		echo "2) Overwrite the file in the repo with the local copy."
		read -p "Enter your choice (1 or 2): " choice

		case $choice in
		1)
			cp "$source_path" "$target_path"
			echo "$file_name in the home directory has been updated with the repo version."
			;;
		2)
			cp "$target_path" "$source_path"
			echo "The repo version of $file_name has been updated with the local copy."
			;;
		*)
			echo "Invalid option selected. No changes made."
			;;
		esac
	else
		# If the file does not exist in the home directory, simply copy it
		cp "$source_path" "$target_path"
		echo "$file_name has been copied to your home directory."
	fi
}

# Sync .bashrc
sync_file ".bashrc"

# Sync .zshrc
sync_file ".zshrc"
