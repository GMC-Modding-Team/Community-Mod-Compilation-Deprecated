#!/usr/bin/env python3

# Make sure you have python3 installed.
# Ensure that the json_formatter is kept in Tools with this script.
# They must be in the same folder!
# For Windows:
# Using command prompt type "python material_ammo_update.py"
# For Max OS X or Linux:
# Swap any "\\" with "/", then run the script as in windows.

import json
import os
import logging
from base_script import change_file

logging.basicConfig(filename="covers_update.log", level=logging.INFO)
logging.info('Started logging.')


def gen_new(path):
    change = False
    with open(path, "r") as json_file:
        try:
            json_data = json.load(json_file)
        except UnicodeDecodeError:
            print("UnicodeDecodeError in {0}".format(path))
            return None
        except json.decoder.JSONDecodeError:
            print("JSONDecodeError in {0}".format(path))
            return None
        for jo in json_data:
            # We only want JsonObjects
            if type(jo) is str:
                continue
            if type(jo.get("material")) == str:
                material = jo["material"]
                jo["material"] = [material]
                change = True
            if type(jo.get("ammo")) == str and jo.get("type") == "ammo":
                ammo = jo["ammo"]
                jo["ammo"] = [ammo]
                change = True

    return json_data if change else None


if __name__ == "__main__":
    json_dir = input("What directory are the json files in? ")
    change_file(json_dir, gen_new)
