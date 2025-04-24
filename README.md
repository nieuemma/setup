# nieuemma's Linux setup script
- is licensed under GPL-3.0
- is made to setup different Linux servers with a very minimal Gnome desktop, and few choice programs.
- is meant to function on systems with apt (Ubuntu), dnf (Fedora), yum (CentOS), and pacman (Arch).
- must be run with root privileges.
- written to be POSIX compliant (for fun)
- also comes with my awesome wallpaper

## Basic Usage
Simply running the script will install a basic Gnome desktop environment.\
I decided to make a script because Gnome includes a lot of extra software.

The script supports the following arguments (only one of these can be used at a time):

| Argument         | Description                                      |
|------------------|--------------------------------------------------|
| `-b`, `--background` | Copies the `gnome.png` file to a specified directory.|
| `-c`, `--copyright`  | Displays a copyright notice.                 |
| `-h`, `--help`       | Lists all available arguments.               |
| `-l`, `--license`    | Displays license information.                |
| `-p`, `--package`    | Installs additional packages.                |
| `-v`, `--version`    | Displays version information.                |
| `-w`, `--warranty`   | Displays a warranty notice.                  |

### Notes:
- When used with `sudo`, -b copies the file to the user's `Pictures` directory. If run as root, it asks for a destination directory.
- The -p option allows you to list package names as additional arguments.
- More functionality is planned for the future.
- This is my first project, as I am new to programming.
- I designed this script for my own use, but it's nice if others find it useful as well.
- Please feel free to recommend improvements or report issues.
