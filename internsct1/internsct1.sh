#!/bin/bash


VERSION="v0.1.0"


show_manual() {
   cat <<EOF
   internctl - Custom Linux Command
   
   SYNOPSIS
   internsctl [OPTION]... [COMMAND]...
   
   DESCRIPTION
   internsctl is a custom Linux command that provides various system-related and user management functions.

   OPTIONS
   --version    Display the version of internsctl
   --help       Display this help message
   
   COMMANDS
   cpu          Display CPU information
   memory       Display memory information
   user         User management commands
   file         File information commands

   For more details on each command, use 'internsctl COMMAND --help'.

   EXAMPLES
   internsctl cpu getinfo          Display CPU information
   internsctl memory getinfo       Display memory information
   internsctl user create <username>  Create a new user
   internsctl user list            List all regular users
   internsctl user list --sudo-only  List users with sudo permissions
   internsctl file getinfo <file-name>  Get information about a file

EOF
}

show_help() {
   case "$1" in
      "cpu" )
         cat <<EOF
         internsctl cpu getinfo - Display CPU information

         Usage: internsctl cpu getinfo

         DESCRIPTION
         Display information about the CPU.

         EXAMPLES
         internsctl cpu getinfo
EOF
         ;;
      "memory" )
         cat <<EOF
         internsctl memory getinfo - Display memory information

         Usage: internsctl memory getinfo

         DESCRIPTION
         Display information about system memory.

         EXAMPLES
         internsctl memory getinfo
EOF
         ;;
      "user" )
         cat <<EOF
         internsctl user - User management commands

         Usage: internsctl user [create <username> | list [--sudo-only]]

         DESCRIPTION
         User management commands.

         COMMANDS
         create <username> - Create a new user.
         list [--sudo-only] - List users. Use --sudo-only to list users with sudo permissions.

         EXAMPLES
         internsctl user create newuser
         internsctl user list
         internsctl user list --sudo-only
EOF
         ;;
      "file" )
         cat <<EOF
         internsctl file getinfo - Get information about a file

         Usage: internsctl file getinfo [options] <file-name>

         DESCRIPTION
         Get information about a file.

         OPTIONS
         --size, -s         Print file size.
         --permissions, -p  Print file permissions.
         --owner, -o        Print file owner.
         --last-modified, -m  Print the last modified timestamp.

         EXAMPLES
         internsctl file getinfo --size hello.txt
         internsctl file getinfo --permissions hello.txt
         internsctl file getinfo --owner hello.txt
         internsctl file getinfo --last-modified hello.txt
EOF
         ;;
      * )
         show_manual
         ;;
   esac
}

case "$1" in
   "cpu" )
      case "$2" in
         "getinfo" )
            
            echo "Implement 'cpu getinfo' functionality here."
            ;;
         * )
            show_help "cpu"
            ;;
      esac
      ;;
   "memory" )
      case "$2" in
         "getinfo" )
            
            echo "Implement 'memory getinfo' functionality here."
            ;;
         * )
            show_help "memory"
            ;;
      esac
      ;;
   "user" )
      case "$2" in
         "create" )
            
            if [ -z "$3" ]; then
               echo "Error: Missing username. Usage: internsctl user create <username>"
            else
               echo "Implement 'user create' functionality here for username: $3."
            fi
            ;;
         "list" )
            if [ "$3" == "--sudo-only" ]; then
               
               echo "Implement 'user list --sudo-only' functionality here."
            else
               
               echo "Implement 'user list' functionality here."
            fi
            ;;
         * )
            show_help "user"
            ;;
      esac
      ;;
   "file" )
      case "$2" in
         "getinfo" )
         
            if [ -z "$3" ]; then
               echo "Error: Missing file name. Usage: internsctl file getinfo <file-name>"
            else
               echo "Implement 'file getinfo' functionality here for file: $3."
            fi
            ;;
         * )
            show_help "file"
            ;;
      esac
      ;;
   "--version" )
      echo "internsctl $VERSION"
      ;;
   "--help" )
      show_help
      ;;
   * )
      show_manual
      ;;
esac

