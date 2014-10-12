# -*- coding: utf8 -*-

# Copyright (C) 2013 - Oscar Campos <oscar.campos@member.fsf.org>
# This program is Free Software see LICENSE file for details

"""
Anaconda helpers
"""

import os
import json
import logging
import functools
import traceback
import subprocess

import sublime

# define if we are in a git installation
git_installation = False
try:
    import Anaconda
    assert Anaconda
except ImportError:
    git_installation = True

NONE = 0x00
ONLY_CODE = 0x01
NOT_SCRATCH = 0x02
LINTING_ENABLED = 0x04


def is_code(view, lang='python', ignore_comments=False, ignore_repl=False):
    """Determine if the given view location is `lang` code
    """

    if view is None:
        return False

    # diable in SublimeREPL
    if view.settings().get('repl', False):
        if not ignore_repl:
            return False

    try:
        location = view.sel()[0].begin()
    except IndexError:
        return False

    if ignore_comments is True:
        matcher = 'source.{}'.format(lang)
    else:
        matcher = 'source.{} - string - comment'.format(lang)

    return view.match_selector(location, matcher)


def is_python(view, ignore_comments=False, autocomplete_ignore_repl=False):
    """Determine if the given view location is python code
    """

    if view is None:
        return False

    # disable in SublimeREPL
    if view.settings().get('repl', False):
        if not autocomplete_ignore_repl:
            return False

    try:
        location = view.sel()[0].begin()
    except IndexError:
        return False

    if ignore_comments is True:
        matcher = 'source.python'
    else:
        matcher = 'source.python - string - comment'

    return view.match_selector(location, matcher)


def check_linting(view, mask, code='python'):
    """Check common linting constraints
    """

    if mask & ONLY_CODE and not is_code(view, lang=code, ignore_comments=True):
        return False

    if mask & NOT_SCRATCH and view.is_scratch():
        return False

    if (mask & LINTING_ENABLED
            and not get_settings(view, 'anaconda_linting', False)):
        return False

    return True


def check_linting_behaviour(view, behaviours):
    """Make sure the correct behaviours are applied
    """

    b = get_settings(view, 'anaconda_linting_behaviour', 'always')
    return b in behaviours


def create_subprocess(args, **kwargs):
    """Create a subprocess and return it back
    """

    if not 'cwd' in kwargs:
        kwargs['cwd'] = os.path.dirname(os.path.abspath(__file__))
    kwargs['bufsize'] = -1

    if os.name == 'nt':
        startupinfo = subprocess.STARTUPINFO()
        startupinfo.dwFlags |= subprocess.STARTF_USESHOWWINDOW
        kwargs['startupinfo'] = startupinfo

    try:
        return subprocess.Popen(args, **kwargs)
    except:
        logging.error(
            'Your operating system denied the spawn of {}'
            ' process. Make sure your configured interpreter is a valid python'
            ' binary executable and is in the PATH'.format(args[0])
        )


def get_settings(view, name, default=None):
    """Get settings
    """

    if view is None:
        return None

    plugin_settings = sublime.load_settings('Anaconda.sublime-settings')

    if name in ('python_interpreter', 'extra_paths'):
        if view.window() is not None and view.window().folders():
            dirname = view.window().folders()[0]
            while True:
                environfile = os.path.join(dirname, '.anaconda')
                if os.path.exists(environfile):
                    # print("Environ found on %s" % environfile)
                    with open(environfile, 'r') as jsonfile:
                        try:
                            data = json.loads(jsonfile.read())
                        except Exception as error:
                            print(error)
                        else:
                            return data.get(
                                name,
                                view.settings().get(name, plugin_settings.get(
                                    name, default)
                                )
                            )
                else:
                    parts = os.path.split(dirname)
                    if len(parts[1]) > 0:
                        dirname = os.path.dirname(dirname)
                    else:
                        break  # stop loop

    return view.settings().get(name, plugin_settings.get(name, default))


def active_view():
    """Return the active view
    """

    return sublime.active_window().active_view()


def prepare_send_data(location, method, handler):
    """Prepare dict that has to be sended trough the socket
    """

    view = active_view()
    return {
        'source': view.substr(sublime.Region(0, view.size())),
        'line': location[0] + 1,
        'offset': location[1],
        'filename': view.file_name() or '',
        'method': method,
        'handler': handler
    }


def project_name():
    """
    Generates and returns back a valid project name for the window

    If there is not worker yet for this window, we create it and set a
    name for it. If we don't have a project file we just use the first
    folder name in the window's folders as name, if we don't have any
    folders in the window we just use the window.window_id
    """

    window = sublime.active_window()
    project_name = window.project_file_name()
    if project_name is None:
        folders = window.folders()
        if len(folders) > 0:
            project_name = window.folders()[0].rsplit(os.sep, 1)[1]
        else:
            project_name = 'anaconda-{id}'.format(id=window.window_id)
    else:
        project_name = project_name.rsplit(os.sep, 1)[1].split('.')[0]

    return project_name


def get_traceback():
    """Get traceback log
    """

    traceback_log = []
    for traceback_line in traceback.format_exc().splitlines():
        traceback_log.append(traceback_line)

    return '\n'.join(traceback_log)


def get_view(window, vid):
    """
    Look for the given view id in the window opened views and return it back
    """

    for view in window.views():
        if view.id() == vid:
            return view


def get_window_view(vid):
    """Look for the given vid in all the opened windows
    """

    for window in sublime.windows():
        view = get_view(window, vid)
        if view is not None:
            return view


def cache(func):
    """
    Stupid and simplistic cache system that caches results from functions
    decorated with it unless the invalidate flag is passed in its args.

    note::
        this is not intend to be used as a general cache solution
    """

    cache = {}

    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        if 'invalidate' in kwargs:
            cache.pop(func.__name__)

        result = cache.get(
            func.__name__,
            cache.setdefault(func.__name__, func(*args, **kwargs))
        )
        return result

    return wrapper


@cache
def valid_languages(**kwargs):
    """Return back valid languages for anaconda plugins
    """

    path = os.path.join(os.path.dirname(__file__), '../../')
    languages = [
        f.rsplit('_', 1)[1].lower() for f in os.listdir(path)
        if f.startswith('anaconda_') and 'vagrant' not in f
    ]

    return ['python'] + languages
