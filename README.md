# nieuemma's Linux setup script
- is licensed under GPL-3.0
- is made to setup different Linux servers with a very minimal Gnome desktop, and few choice programs.
- is meant to function on systems with apt (Ubuntu), dnf (Fedora), yum (CentOS), and pacman (Arch).
- must be run with root privileges.
- written to be POSIX compliant (for fun)
- also comes with my awesome wallpaper

## Basic Usage
Simply running the script will install the Gnome desktop environment and a few choice programs. I decided initally to make a script because installing Gnome gives you a lot of default apps and things I don't want or need. I enjoy having a working Gnome desktop with ~2GiB of space used (as measured with a fresh Arch Linux installation).
The following arguments are available when running the script, but only one argument at a time. Multiple arguments will simply run the first argument.

-b or --background        Copy gnome.png\
-c or --copyright         Displays a copyright notice\
-h or --help              Lists available arguments\
-l or --license           Displays license information\
-p or --package           Install additional packages\
-v or --version           Displays version information\
-w or --warranty          Displays warranty notice

  When using -b or --background as a normal user with sudo, the script will copy the gnome.png file to the user's Pictures directory. If run as root, it will ask you to specify a destination directory.

  More functionality will be added in the future.
  This is my first project, as I am new to programming.
  I designed this script for my own use, but it would be wonderful if others found it useful as well. Please feel free to recommend improvements or report issues. I would also appreciate any critiques of my scripting style, as I am just beginning to learn and improve my coding skills.
