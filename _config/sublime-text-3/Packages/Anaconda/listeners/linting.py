
# Copyright (C) 2013 - Oscar Campos <oscar.campos@member.fsf.org>
# This program is Free Software see LICENSE file for details

import time

import sublime
import sublime_plugin

from ..anaconda_lib.helpers import (
    check_linting, get_settings, check_linting_behaviour,
    ONLY_CODE, NOT_SCRATCH, LINTING_ENABLED, is_code
)
from ..anaconda_lib.linting.sublime import (
    ANACONDA, erase_lint_marks, run_linter,
    last_selected_lineno, update_statusbar
)


class BackgroundLinter(sublime_plugin.EventListener):
    """Background linter, can be turned off via plugin settings
    """

    check_auto_lint = False

    def __init__(self, lang='Python', linter=run_linter):
        super(BackgroundLinter, self).__init__()
        self.lang = lang
        self.run_linter = linter
        self.last_selected_line = -1
        sublime.set_timeout(self.lint, 1000)

    def lint(self):
        view = sublime.active_window().active_view()
        if get_settings(view, 'anaconda_linting_behaviour') != 'always':
            if not self.check_auto_lint:
                self.check_auto_lint = True
            return

        delay = get_settings(view, 'anaconda_linter_delay', 0.5)
        valid_code = is_code(view, lang=self.lang.lower())
        if not ANACONDA['ALREADY_LINTED'] and valid_code:
            if time.time() - ANACONDA['LAST_PULSE'] >= delay:
                ANACONDA['ALREADY_LINTED'] = True
                self.run_linter(view)

        sublime.set_timeout(lambda: self.lint(), int(delay * 1000))

    def on_modified(self, view):
        """
        Called after changes have been made to a view.
        Runs in a separate thread, and does not block the application.
        """

        constraints = ONLY_CODE | NOT_SCRATCH | LINTING_ENABLED
        if (check_linting(view, constraints, code=self.lang.lower())
                and check_linting_behaviour(view, ['always'])):
            # update the last selected line number
            self.last_selected_line = -1
            ANACONDA['LAST_PULSE'] = time.time()
            ANACONDA['ALREADY_LINTED'] = False
            if not get_settings(view, 'anaconda_linter_persistent', False):
                erase_lint_marks(view)
            if self.check_auto_lint:
                self.lint()
        else:
            self._erase_marks_if_no_linting(view)

    def on_load(self, view):
        """Called after load a file
        """

        if (check_linting(view, ONLY_CODE, code=self.lang.lower())
                and check_linting_behaviour(view, ['always', 'load-save'])):
            if self.lang in view.settings().get('syntax'):
                self.run_linter(view)
        else:
            self._erase_marks_if_no_linting(view)

    def on_pre_close(self, view):
        """Called when the view is about to be closed
        """

        self._erase_marks(view)
        for severity in ['VIOLATIONS', 'WARNINGS', 'ERRORS']:
            ANACONDA[severity][view.id()] = {}

    def on_post_save(self, view):
        """Called post file save event
        """

        if check_linting(
                view, NOT_SCRATCH | LINTING_ENABLED, code=self.lang.lower()):
            if self.lang in view.settings().get('syntax'):
                self.run_linter(view)
        else:
            self._erase_marks_if_no_linting(view)

    def on_activated(self, view):
        """Called when a view gain the focus
        """

        if (check_linting(
                view, ONLY_CODE | LINTING_ENABLED, code=self.lang.lower())
                and check_linting_behaviour(view, ['always'])):
            if self.lang in view.settings().get('syntax'):
                self.run_linter(view)
        else:
            self._erase_marks_if_no_linting(view)

    def on_selection_modified(self, view):
        """Called on selection modified
        """

        constraints = ONLY_CODE | NOT_SCRATCH | LINTING_ENABLED
        if (not check_linting(view, constraints, code=self.lang.lower())
                or not self.lang in view.settings().get('syntax')):
            return

        last_selected_line = last_selected_lineno(view)

        if last_selected_line != self.last_selected_line:
            self.last_selected_line = last_selected_line
            update_statusbar(view)

    def _erase_marks_if_no_linting(self, view):
        """Erase the anaconda marks if linting is disabled
        """

        if not check_linting(view, LINTING_ENABLED, code=self.lang.lower()):
            self._erase_marks(view)

    def _erase_marks(self, view):
        """Just a wrapper for erase_lint_marks
        """

        erase_lint_marks(view)
