#!/bin/sh
#    Copyright (C) 2025  nieuemma

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Default config file path
CONF_FILE="$(dirname "$0")/setup.conf"

# pkg_install failure message
PKG_FAIL="Package installation failed"

# Set error handling
handle_error() {
    echo "Error: $1" >&2
    exit 1
}

# Require run as root
require_root() {
    if [ "$EUID" -ne 0 ]; then
        handle_error "This script must be run as root or with sudo"
    fi
}

# Load configuration file
conf_load() {
    if [ -f "$CONF_FILE" ]; then
        . "$CONF_FILE"
    else
        handle_error "Configuration file not found"
    fi
}

# Process arguments
arguments() {
    while [ $# -gt 0 ]; do
        case "$1" in
            --copyright|-c)
                 echo "$GPL_CP"
                 exit 0
                ;;
            --warranty|-w)
                echo "$GPL_WR"
                exit 0
                ;;
            --background|-b)
                # copy wallpaper to backgrounds directory
                if [ -f "$(dirname "$0")/gnome.png" ]; then
                    wallpaper_copy
                    exit 0
                else
                    handle_error "file not found"
                fi
                ;;
            --license|-l)
                echo "$GPL_INFO"
                exit 0
                ;;
            --version|-v)
                echo "setup.sh $VERSION"
                exit 0
                ;;
            --help|-h)
                echo "Usage: $0 [--warranty] [--copyright]"
                echo "  --background|-b  Copy wallpaper to backgrounds directory"
                echo "  --copyright|-c   Display copyright information"
                echo "  --help|-h        Display this help message"
                echo "  --license|-l     Display license information"
                echo "  --version|-v     Display version information"
                echo "  --warranty|-w    Display warranty information"
                exit 0
                ;;
            *)
                echo "Unknown option: $1" >&2
                echo "Try '$0 --help' for more information." >&2
                exit 1
                ;;
        esac
        shift
    done
}

# Display GPL notice
gpl_notice() {
        echo "$GPL"
        sleep 6
}

# Find package manager and install packages
pkmn_check() {
if command -v apt > /dev/null 2>&1; then
    apt install -y $DEB_PKG || handle_error $PKG_FAIL
elif command -v dnf > /dev/null 2>&1; then
    dnf install -y $RHL_PKG || handle_error $PKG_FAIL
elif command -v yum > /dev/null 2>&1; then
    yum install -y $RHL_PKG || handle_error $PKG_FAIL
elif command -v pacman > /dev/null 2>&1; then
    pacman -S --noconfirm --needed $ARCH_PKG || handle_error $PKG_FAIL
else
    handle_error "No supported package manager found"
fi
}

# Copy wallpaper to backgrounds directory
wallpaper_copy() {
if [ -n "$SUDO_HOME" ]; then
    if [ ! -d "$SUDO_HOME/Pictures" ]; then
        mkdir -p "$SUDO_HOME/Pictures"
    fi
        cp "$(dirname "$0")/gnome.png" "$SUDO_HOME/Pictures/gnome.png"
        echo "image copied to $SUDO_HOME/Pictures"
else
    echo "Please choose a directory"
    read dir_path
    if [ ! -d "$dir_path" ]; then
        mkdir -p "$dir_path"
        chmod 777 "$dir_path"
    fi
        cp "$(dirname "$0")/gnome.png" "$dir_path/gnome.png"
        echo "image copied to $dir_path"
    fi
}


# Execute functions
require_root
conf_load
arguments "$@"
gpl_notice
pkmn_check
