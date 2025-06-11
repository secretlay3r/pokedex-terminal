#!/bin/sh

INSTALL_DIR='/usr/local/opt/pokedex-terminal'
BIN_DIR='/usr/local/bin'


if [ "$SUDO_USER" ]; then
    REAL_USER="$SUDO_USER"
else
    REAL_USER="$(whoami)"
fi


USER_HOME=$(eval echo "~$REAL_USER")

sudo rm -rf "$INSTALL_DIR" || exit 1

sudo mkdir -p "$INSTALL_DIR" || exit 1

sudo cp -rf sprite_data "$INSTALL_DIR"
sudo cp pokedex-terminal.py "$INSTALL_DIR"

sudo chmod +x "$INSTALL_DIR/pokedex-terminal.py"

sudo rm -f "$BIN_DIR/pokemon" || exit 1

sudo ln -s "$INSTALL_DIR/pokedex-terminal.py" "$BIN_DIR/pokemon"

echo "pokedex-terminal installed successfully."
echo "You can run it by typing 'pokemon' in your terminal."


read -p "Do you want to display a Pokémon on each terminal startup? (y/N): " answer
if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    USER_SHELL=$(getent passwd "$REAL_USER" | cut -d: -f7)
    SHELL_NAME=$(basename "$USER_SHELL")

    if [ "$SHELL_NAME" = "bash" ]; then
        RC_FILE="$USER_HOME/.bashrc"
        if [ -f "$USER_HOME/.bash_profile" ] && ! grep -q ".bashrc" "$USER_HOME/.bash_profile"; then
            echo "source ~/.bashrc" | sudo tee -a "$USER_HOME/.bash_profile" > /dev/null
            sudo chown "$REAL_USER":"$REAL_USER" "$USER_HOME/.bash_profile"
            echo "Added 'source ~/.bashrc' to $USER_HOME/.bash_profile"
        fi
    elif [ "$SHELL_NAME" = "zsh" ]; then
        RC_FILE="$USER_HOME/.zshrc"
    else
        RC_FILE="$USER_HOME/.bashrc"
    fi

    if ! sudo grep -q "pokemon -r" "$RC_FILE"; then
        echo "" | sudo tee -a "$RC_FILE" > /dev/null
        echo "# Display a random Pokémon on terminal startup" | sudo tee -a "$RC_FILE" > /dev/null
        echo "pokemon -r" | sudo tee -a "$RC_FILE" > /dev/null
        sudo chown "$REAL_USER":"$REAL_USER" "$RC_FILE"
        echo "Added Pokémon display to $RC_FILE"
    else
        echo "Pokémon display already configured in $RC_FILE"
    fi
fi