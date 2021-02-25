#!/usr/bin/env python
import sys
import os
from pathlib import Path
import shutil

# Ensure that the path is correct.
PATH_TO_LOCALE = Path(__file__).parent.absolute()
LOCALES = tuple(
    PATH_TO_LOCALE.joinpath(d) for d in os.scandir(PATH_TO_LOCALE) if d.is_dir()
)

for line in sys.stdin:
    line = line.split("\t")
    if len(line) == 3:
        code, old_file, new_file = line.split("\t")
        code = code[0]
    else:
        code, filepath = line

    # We only handle deleted or renamed files.
    if code not in ("D", "R"):
        continue

    # filepath starts relative to Community-Mod-Compilation/. Remove data/
    filepath = Path(*Path(filepath).parts[1:])
    old_file = Path(*Path(old_file).parts[1:])
    new_file = Path(*Path(new_file).parts[1:])

    if code == "D":
        for locale in LOCALES:
            path = Path(locale, filepath)
            # It is quite probable that the translation does not exist.
            if path.is_file():
                path.unlink()

    elif code == "R":
        for locale in LOCALES:
            locale_new = Path(locale, new_file)
            locale_old = Path(locale, old_file)
            if locale_old.is_file():
                shutil.copy(locale_old, locale_new)
                locale_old.unlink()
