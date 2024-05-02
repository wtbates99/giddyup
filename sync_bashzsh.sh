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
		echo "$file_name exists in your home directory."
		read -p "Do you want to overwrite it with the standard version? (y/n) " -n 1 -r
		echo
		if [[ $REPLY =~ ^[Yy]$ ]]; then
			cp "$source_path" "$target_path"
			echo "$file_name has been updated."
		else
			echo "No changes made to $file_name."
		fi
	else
		# If the file does not exist, simply copy it
		cp "$source_path" "$target_path"
		echo "$file_name has been copied to your home directory."
	fi
}

# Sync .bashrc
sync_file ".bashrc"

# Sync .zshrc
sync_file ".zshrc"
