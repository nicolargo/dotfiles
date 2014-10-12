
# Copyright (C) 2013 - Oscar Campos <oscar.campos@member.fsf.org>
# This program is Free Software see LICENSE file for details

from .base import Command


class FindUsages(Command):
    """Get back a python usages for the given object
    """

    def __init__(self, callback, uid, script):
        self.script = script
        super(FindUsages, self).__init__(callback, uid)

    def run(self):
        """Run the command
        """

        try:
            usages = self.script.usages()
            success = True
        except:
            usages = None
            success = False

        self.callback({
            'success': success,
            'usages': [
                (i.module_path, i.line, i.column)
                for i in usages if not i.in_builtin_module()
            ] if usages is not None else [],
            'uid': self.uid
        })
