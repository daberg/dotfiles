from __future__ import (absolute_import, division, print_function)

from ranger.api.commands import Command


class terminal(Command):
    """:terminal

    Spawns an "x-terminal-emulator" starting in the current directory.
    """

    def execute(self):
        self.fm.run("alacritty", flags="f")


class rename_prepend(Command):
    """:rename_prepend

    Opens the console with ":rename <current file>" with the cursor positioned
    before the whole file name.
    """
    def __init__(self, *args, **kwargs):
        super(rename_prepend, self).__init__(*args, **kwargs)

    def execute(self):
        from ranger import MACRO_DELIMITER, MACRO_DELIMITER_ESC

        tfile = self.fm.thisfile
        relpath = tfile.relative_path.replace(MACRO_DELIMITER, MACRO_DELIMITER_ESC)

        self.fm.open_console('rename ' + relpath, position=7)
