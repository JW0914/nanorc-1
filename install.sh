#!/bin/sh

             ##::[[-----  Custom NanoRC Install Script -----]]::##

#==============================================================================

# check for unzip before we continue
if [ ! "$(command -v unzip)" ]; then
  echo '\n\n  Required, but not found: unzip \n\n  Please install unzip first, then run script again.\n\n' >&2
  exit 1
fi

# Download and extract repo:
_fetch_sources(){
  wget -O /tmp/nanorc.zip https://github.com/JW0914/nanorc-1/archive/master.zip

  if [ ! -d ~/.nano ]; then
    mkdir -p ~/.nano
    cd ~/.nano || exit
  fi

  unzip -o "/tmp/nanorc.zip"
    mv nanorc-1-master/* ./
    rm -rf nanorc-1-master
    rm /tmp/nanorc.zip
}

# Create nanorc file:
_update_nanorc(){
  if [ ! -f ~/.nanorc ]; then
    touch ~/.nanorc
  fi

  cat ~/.nano/nanorc >> ~/.nanorc
}

# Install:
_fetch_sources; _update_nanorc
