import os
import pathlib
import re
import sys
import shutil


def rmr(path):
    if path.is_dir() and not path.is_symlink(path):
        shutil.rmtree(str(path))
    elif path.exists():
        os.remove(path)

def matches_patterns(matchable, patterns):
    for pattern in patterns:
        if re.match(pattern, matchable):
            return True
    return False

def yesno():
    yes = {'yes','y', 'ye', ''}
    no = {'no','n'}

    while(True):
        choice = input().lower()
        if choice in yes:
            return True
        elif choice in no:
            return False
        else:
            print("Please respond with 'yes' or 'no'")


if len(sys.argv) != 3:
    print("USAGE:")
    print("        python pbup.py [SRC] [DST]")
    sys.exit(1)

srcpath = pathlib.Path(sys.argv[1])
destpath = pathlib.Path(sys.argv[2])

exclude_patterns = [
    '\.git.*',
    'screenshot',
    'packagelist'
]
exclude_compiled = [re.compile(pattern) for pattern in exclude_patterns]

paths = [path for path in list(srcpath.rglob("*")) if path.is_file()]

for path in paths:
    rootless_filepath = pathlib.Path(*path.parts[1:])

    matchable = str(rootless_filepath)
    if matches_patterns(matchable, exclude_compiled):
        print("Skipping {}".format(str(path)))
        print()
        continue

    linkpath = destpath.joinpath(rootless_filepath)
    target = path.resolve()

    if linkpath.exists():
        print("{} already exists".format(linkpath))
        print("Delete and replace it with a link? [y/n]")
        if not yesno():
            print("Skipping".format(linkpath))
            print()
            continue

        print("Deleting")

        try:
            rmr(linkpath)
        except Exception:
            print("Could not remove {}. Skipping".format(linkpath))
            print()
            continue

    parent = linkpath.parent

    if not parent.is_dir():
        try:
            print("Creating directory path {}".format(parent))
            parent.mkdir(parents=True, exist_ok=True)
        except Exception:
            print("Something went wrong. Skipping")
            print()
            continue

    print("Creating symbolic link {} to {}".format(linkpath, target))
    os.symlink(target, linkpath)
    print()
