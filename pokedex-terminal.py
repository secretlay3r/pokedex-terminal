#!/usr/bin/env python3
import os
import random
import argparse

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
SPRITES = os.path.join(SCRIPT_DIR, "sprite_data")

def list_pokemons(): # yes I know that it is akshually correct to spell list_pokemon
    files = [f[:-4] for f in os.listdir(SPRITES) if f.endswith(".txt")]
    return sorted(files)


def display(name):
    pokemons = list_pokemons()
    matched = None
    name_cf = name.casefold()
    for p in pokemons:
        if p.casefold() == name_cf:
            matched = p
            break
    if not matched:
        print(f"Pokémon '{name}' not found :/")
        return
    path = os.path.join(SPRITES, f"{matched}.txt")
    with open(path, "r", encoding="utf-8") as f:
        sprite = f.read()
    print(f"\033[1m{matched.capitalize()}\033[0m")
    print(sprite)


def display_random():
    pokemons = list_pokemons()
    if not pokemons:
        print("No Pokémon sprites found.")
        return
    name = random.choice(pokemons)
    display(name)



def main():
    parser = argparse.ArgumentParser(description="Pokédex 1998 Pokémon in your terminal!")
    group = parser.add_mutually_exclusive_group()
    group.add_argument("-r", "--random", action="store_true", help="show random Pokémon")
    group.add_argument("-n", "--name", type=str, help="show Pokémon by name")
    group.add_argument("-l", "--list", action="store_true", help="show all Pokémon")
    args = parser.parse_args()


    if args.list:
        pokemons = list_pokemons()
        for p in pokemons:
            print(p)
    elif args.name:
        display(args.name.lower())
    else:
        display_random()

if __name__ == "__main__":
    main()