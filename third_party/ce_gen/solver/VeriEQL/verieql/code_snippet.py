# -*- coding: utf-8 -*-


class CodeSnippet(object):
    def __init__(self, code: str, docstring: str = None, docstring_first=False, code_string=None):
        self.code = code  # str or CodeSnippet itself
        self.docstring = '# ' + (docstring or '')
        self.docstring_first = docstring_first
        self._code_string = code_string if code_string is None else code_string.strip(
            '\n')  # only store codes which are TOOOOO LONG

    def __str__(self):
        code_string = str(self.code) if self._code_string is None else self._code_string
        if len(self.docstring) > 2:
            if self.docstring_first:
                return f'{self.docstring}\n{code_string}'
            else:
                return f'{code_string}  {self.docstring}'
        else:
            return f'{code_string}'

    def __repr__(self):
        return self.docstring
