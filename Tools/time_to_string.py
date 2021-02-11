#!/usr/bin/env python3

# Make sure you have python3 installed.
# Ensure that the json_formatter is kept in Tools with this script.
# They must be in the same folder!
# For Windows:
# Using command prompt type "python time_to_string.py"
# For Max OS X or Linux:
# Swap any "\\" with "/", then run the script as in windows.

import json
import os


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

            # These need no conversion.
            if type(jo.get("time")) == str:
                continue

            # It has to have time.
            if not jo.get("time"):
                continue

            if jo.get("type") == "construction":
                # Convert time to minutes.
                jo["time"] = str(jo["time"]) + " m"
                change = True

            elif jo.get("type") == "recipe":
                # Convert time from turns to seconds, then minutes.
                # Loses the remainder.
                turns = jo["time"]
                turns //= 100
                if turns % 60 == 0:
                    turns //= 60
                    jo["time"] = str(turns) + " m"
                else:
                    jo["time"] = str(turns) + " s"
                change = True

    return json_data if change else None


def change_file(json_dir):
    for root, directories, filenames in os.walk("..\\{0}".format(json_dir)):
        for filename in filenames:
            path = os.path.join(root, filename)
            if path.endswith(".json"):
                new = gen_new(path)
                if new is not None:
                    with open(path, "w") as jf:
                        json.dump(new, jf, ensure_ascii=False)
                    os.system(".\\json_formatter.exe {0}".format(path))


if __name__ == "__main__":
    json_dir = input("What directory are the json files in? ")
    change_file(json_dir)
