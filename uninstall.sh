#!/bin/sh

INSTALL_DIR='/usr/local/opt/pokedex-terminal'
BIN_DIR='/usr/local/bin'
DESKTOP_ENTRY_NAME='pokedex-terminal.desktop'

if [ -n "$SUDO_USER" ]; then
    USER_HOME=$(eval echo "~$SUDO_USER")
else
    USER_HOME="$HOME"
fi


BASHRC="$USER_HOME/.bashrc"

echo "Uninstalling pokedex-terminal..."



if [ -d "$INSTALL_DIR" ]; then
    sudo rm -rf "$INSTALL_DIR"
    echo "Removed installation directory: $INSTALL_DIR"
else
    echo "Installation directory not found: $INSTALL_DIR"
fi


if [ -L "$BIN_DIR/pokemon" ] || [ -f "$BIN_DIR/pokemon" ]; then
    sudo rm -f "$BIN_DIR/pokemon"
    echo "Removed binary/symlink: $BIN_DIR/pokemon"
else
    echo "Binary/symlink not found: $BIN_DIR/pokemon"
fi


if [ -f "$BASHRC" ]; then
    sed -i.bak '/pokemon/d' "$BASHRC" && echo "Removed 'pokemon' command from $BASHRC"
else
    echo "$BASHRC not found, skipping shell config cleanup"
fi


ZSHRC="$USER_HOME/.zshrc"
if [ -f "$ZSHRC" ]; then
    sed -i.bak '/pokemon/d' "$ZSHRC" && echo "Removed 'pokemon' command from $ZSHRC"
else
    echo "$ZSHRC not found, skipping shell config cleanup"
fi

echo "pokedex-terminal uninstalled successfully."
