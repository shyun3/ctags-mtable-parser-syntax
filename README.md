# vim-ctags-mtable

Fork of [ctags mtable parser syntax](https://www.vim.org/scripts/script.php?script_id=6112).

## License

Uses the Vim license. See `:help license`.

## Description

Syntax file for ctags options from _*.ctags_, files used to write stateful mtable (multi-table) parsers for ctags, based on regular expression tables.

See https://docs.ctags.io/en/latest/optlib.html for writing ctags parsers.

Only for mtable parsers (the recommended type using `--_mtable-regex-`).

Parses using line regexps `--regex-` and multi-line regexps `--mline-regex-` are not highlighted. Some other `ctags` options are included as well, but unrelated options will not be highlighted.

POSIX Extened Regular expressions (EREs, the default in ctags) are highlighted as plain strings by default. But for any real work on a parser, you should enable highlighting inside the regular expressions with:

* `:let g:ctags_syntax_show_regexp = v:true`
* `:let b:ctags_syntax_show_regexp = -1`

The buffer variable `b:ctags_syntax_show_regex` has precedence over the global variable `g:ctags_syntax_show_regexp`. Use a true value to enable highlighting, as follows:

* use a negative value (`-1`) for monochrome highlighting of the regular expressions. Easier to read if you want to browse the source code of a ctags parser.
* use a positive value (`v:true` or `1`) for full-color highlighting of the regular expressions. This is what you usually want to develop a new parser.

Non-default regular expressions, such as POSIX basic RE (BRE) and PCRE2, are detected and will not be highlighted.

Some errors in a regular expression can be higlighted by the syntax, and will be shown in the right color (if you enabled regex colors).

Some corner cases for character ranges, usually of the form `[^]a-z]` or `[],|0-9]` (notice the closing bracket inside) cannot be fully highlighted yet, so the nested closing bracket will take the color of the delimiter (same as the opening bracket), instead of the content color.

Screenshots:
   - night-owl color scheme:  https://ibb.co/ncLpV0B
   - toast color scheme:        https://ibb.co/wRczkGd
   - duoduo color scheme:    https://ibb.co/xhdsdcw


This is only a syntax plugin, not a file type. To avoid manual loading of the syntax, you can add these lines to your vimrc file, after installation:
```vim
autocmd BufNewFile,BufRead *.ctags setfiletype ctags
autocmd FileType ctags setlocal syntax=ctags
```

The Ghostscript code blocks for optscript (for `--_mtable-regex`, `--_prelude` and `--_sequel` options) are matched by the regexps, but not currently highlighted as PostScript , because somehow the nested PostScript syntax breaks the main ctags syntax.

You can adjust the highlighting, if it does not look good on your color scheme or your monitor settings:
- create a new file _~/.vim/after/syntax/ctags.vim_
- check for the specific color scheme using:
    ```vim
    if exists('g:colors_name') && g:colors_name == 'colorscheme'
    endif
    ```
- change highlighting for any of the below elements with in the if/endif above:
    ```vim
    highlight link ctagsStatement Statement
    highlight link ctagsLanguageName Type
    highlight link ctagsFlagName Keyword
    highlight link ctagsFlagNameLetter Keyword
    ....
    ```

See all items to be highlighted at the end for the script file, installed at _~/.vim/syntax/ctags.vim_.

The syntax items above will look familiar if you already know about ctags fields, kinds, roles, extras, languages, regex flags.
