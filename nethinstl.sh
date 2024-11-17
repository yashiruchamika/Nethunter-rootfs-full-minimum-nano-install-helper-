#!/bin/bash

# 1. Ask for the user's name
echo "Hi, what is your name?"
read name

# 2. Display a welcome message with figlet
echo "Welcome, $name!"
pkg install figlet -y
figlet "Welcome, $name!"

# 3. Ask for the NetHunter version
echo "Which version of NetHunter would you like to install?"
echo "1. nethunter rootfs full arm64"
echo "2. nethunter rootfs minimal arm64"
echo "3. nethunter rootfs nano arm64"
read -p "Please enter the option number (1, 2, or 3): " option

# 4. Determine the selected version and download it using aria2c
case $option in
    1)
        url="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-full-arm64.tar.xz"
        output="kali-nethunter-rootfs-full-arm64.tar.xz"
        ;;
    2)
        url="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-minimal-arm64.tar.xz"
        output="kali-nethunter-rootfs-minimal-arm64.tar.xz"
        ;;
    3)
        url="https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-nano-arm64.tar.xz"
        output="kali-nethunter-rootfs-nano-arm64.tar.xz"
        ;;
    *)
        echo "Invalid option. Exiting."
        exit 1
        ;;
esac

# 5. Download the selected version using aria2c
echo "Downloading Kali NetHunter version: $output..."
aria2c --continue=true -o "$output" "$url"

# 6. Extract the downloaded file
echo "Extracting $output..."
tar -xf "$output"

echo "NetHunter version has been downloaded and extracted successfully!"
