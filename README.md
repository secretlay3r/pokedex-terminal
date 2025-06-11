# pokedex-terminal

[![AUR](https://img.shields.io/static/v1?label=AUR&message=pokedex-terminal&color=blue)](https://aur.archlinux.org/packages/pokedex-terminal)

Pokédex 1998 Pokémon in your terminal!

Print monochrome Kanto / Gen 1 Pokémon whenever you want.
> This is a fun project and is not affiliated with Pokémon in any way. No commercial use or profit is made.

---

## Screenshots

<p align="left">
  <a href="https://github.com/user-attachments/assets/adaec27b-b21d-4ea5-82b4-e7982ca40dc0" target="_blank">
    <img src="https://github.com/user-attachments/assets/adaec27b-b21d-4ea5-82b4-e7982ca40dc0" width="350" alt="Screenshot 1" />
  </a> 
  <a href="https://github.com/user-attachments/assets/df86e275-7c09-40d1-9e0d-60f73f3bd784" target="_blank">
    <img src="https://github.com/user-attachments/assets/df86e275-7c09-40d1-9e0d-60f73f3bd784" width="350" alt="Screenshot 2" />
  </a> 
  <a href="https://github.com/user-attachments/assets/d04b85db-e33f-463a-8ee0-6efff76a91a6" target="_blank">
    <img src="https://github.com/user-attachments/assets/d04b85db-e33f-463a-8ee0-6efff76a91a6" width="350" alt="Screenshot 3" />
  </a> 
  <a href="https://github.com/user-attachments/assets/5fa66009-6bda-4d4a-817c-4921286312b0" target="_blank">
    <img src="https://github.com/user-attachments/assets/5fa66009-6bda-4d4a-817c-4921286312b0" width="350" alt="Screenshot 4" />
  </a>
</p>

---

## Installation

### Arch Linux

This package is available on AUR: [pokedex-terminal](https://aur.archlinux.org/packages/pokedex-terminal)

You can install it with the yay helper:

```
yay -S pokedex-terminal
```

### Other Systems

1. Clone or download the repository:

```
git clone https://github.com/secretlay3r/pokedex-terminal
```

2. Cd into the repo directory and run the install script:

```
cd pokedex-terminal
sudo ./install.sh
```

3. To see all available commands, run:

```
pokemon -h
```

---

## Running on Terminal Startup

The `install.sh` script configures startup for Bash and Zsh shells only.

If you use Fish shell, add the following to your `config.fish` to override the greeting:

```
function fish_greeting
     pokemon -r
end
```

---

## Adding to Neofetch

Neofetch may not display the ASCII art correctly.  
I'd recommended to use [neowofetch](https://github.com/hykilpikonna/hyfetch) instead.

In `neowofetch`'s `config.conf`, set the image source as:

```
image_source=$(pokemon -r)
```

---

## Usage

To list all available commands:

```
pokemon -h
```

```
Usage summary:

usage: pokemon [-h] [-r | -n NAME | -l]

Pokédex 1998 Pokémon in your terminal!

options:
-h, --help show this help message and exit
-r, --random show random Pokémon
-n NAME, --name NAME show Pokémon by name
-l, --list show all Pokémon

```

Running `pokemon` or `pokemon -r` will print a random Pokémon.

---

## Uninstall

### Arch Linux (if installed via yay)

```
yay -R pokedex-terminal
```

### Other Systems

```
sudo ./uninstall.sh
```

---

## Credits (in no specific order)

- [dex98](https://github.com/ace-dent/dex98) (Sprites)  
- [pokeshell](https://github.com/acxz/pokeshell)  
- [krabby](https://github.com/yannjor/krabby)  
- [pokeget](https://github.com/talwat/pokeget)  
- [pokemon-colorscripts](https://gitlab.com/phoneybadger/pokemon-colorscripts)
  
and perhaps many others I forgot to mention..
