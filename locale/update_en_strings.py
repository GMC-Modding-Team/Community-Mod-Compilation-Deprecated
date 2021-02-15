#!/usr/bin/env python

import orjson
from orjson import OPT_APPEND_NEWLINE, OPT_INDENT_2
import os
from pathlib import Path
from stat import S_IXOTH

# TODO: Make a script that doesn't rely on recreating every file.
PRETTY_PRINT = OPT_APPEND_NEWLINE | OPT_INDENT_2


def generate_localisation_file(path: Path):
    # Assume Community-Mod-Compilation/data/.
    # Assume this script is in locale, and then make absolute.
    locale_file = Path("en", *path.parts[2:]).resolve()

    if not locale_file.is_file():
        if not locale_file.parent.is_dir():
            locale_file.parent.mkdir(mode=S_IXOTH, parents=True, exist_ok=True)
            # Get every directory starting from Community-Mod-Compilation/locale/en/
            # TODO: Replace this with a call to range().
            for i, p in enumerate(locale_file.parts[3:-1], 4):
                parent_dir = os.path.join(locale_file.parts[:i])
                # Check if permission allows everybody to execute.
                if os.stat(parent_dir)[0] != S_IXOTH:
                    os.chmod(parent_dir, S_IXOTH)
        # Annoying, but this is the only file creation option on Windows and MacOS
        with open(locale_file, "w"):
            pass

    # Return path to the new file.
    return locale_file


def get_translation_strings(path: Path):
    tr_file = []
    try:
        json = orjson.loads(path.read_bytes())
    except orjson.JSONDecodeError:
        raise orjson.JSONDecodeError(f"File: {path}")

    if type(json) is not list:
        return

    for jo in json:
        if type(jo) is not dict:
            continue
        # TODO: Check if there are things without descriptions to be translated.
        if jo.get("description") and jo.get("name"):
            tr_file.append({"name": jo["name"], "description": jo["description"]})

    return tr_file


def main(directory):
    for root, dirnames, filenames in os.walk(directory):
        for filename in [f for f in filenames if f.endswith(".json")]:
            path = Path(root, filename)
            tr_file = get_translation_strings(path)
            # No point in generating a new file if it's going to be empty.
            if not tr_file:
                continue
            local = generate_localisation_file(path)
            with open(local, "wb") as f:
                f.write(orjson.dumps(tr_file, option=PRETTY_PRINT))


if __name__ == "__main__":
    import sys

    main(sys.argv[1])
