#!/bin/sh

INSTALL_DIR="/usr/share/gtk-ui/"

error() {
  printf " Failed.\n"
  if [ "$UID" != "0" ]; then
    echo "Error: You must run this script as root!"
  fi
  exit
}

if [ "$1" != "-r" ]; then
  printf "Installing GtkUI libraries..."
  if [ ! -d "$INSTALL_DIR" ]; then
    mkdir "$INSTALL_DIR" &> /dev/null || error
  fi

  cp *.gui "$INSTALL_DIR" &> /dev/null || error
else
  printf "Removing all GtkUI libraries..."
  rm -rf /usr/share/gtkui/ &> /dev/null || error
fi

printf " Done!\n"
