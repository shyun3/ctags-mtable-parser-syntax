" Vim syntax file
" Language:		ctags
" Maintainer:		Timothy Madden <terminatorul@gmail.com>
" Last Change:		2024 Jun 12
" Version:              0.5
" Remark:		for mtable parsers only
" GetLatestVimScripts:  6112 28715 :AutoInstall: ctags-mtable-parser-syntax.vmb
" Options Flags:
"    b:ctags_syntax_show_regexp        - enable syntax in regular expressions
"    g:ctags_syntax_show_regexp        - enable syntax in regular expressions

if exists('b:current_syntax')
    finish
endif

syntax case match

syntax match ctagsFlagOptions /\v^(\-[RaexuGnNBFVw]|\-\-(guess-language-eagerly|version|put-field-prefix|list-(excludes|features|languages|(mline-)?regex-flags|pseudo-tags)|_list-(operators|(langdef|mtable-regex|kinddef|langdef)-flags)|help(-full)?|license|print-language))$/
highlight link ctagsFlagOptions ctagsStatement

syntax match ctagsYesNoOptions /\v^\s*\-\-(filter|links|recurse|append|if0|line-directives|machinable|with-list-header|quiet|verbose)>/ nextgroup=ctagsYesNoOptDelim
syntax match ctagsYesNoOptDelim /=/ contained nextgroup=ctagsYesNoOption
syntax match ctagsYesNoOption /\v\=@<=(yes|no)$/ contained

highlight link ctagsYesNoOptions ctagsStatement
highlight link ctagsYesNoOptDelim ctagsOperator
highlight link ctagsYesNoOption ctagsKeyword

"   --force-quit[=<exit-code>]
"   --maxdepth=<N>
"   --pattern-length-limit=<N>
syntax match ctagsNumericOptions /\v^\s*\-\-(force-quit|maxdepth|pattern-length-limit)>/ nextgroup=ctagsNumericOptDelim
syntax match ctagsNumericOptDelim /=/ contained nextgroup=ctagsNumericOption
syntax match ctagsNumericOption /\v\=@<=\d+$/ contained

highlight link ctagsNumericOptions ctagsStatement
highlight link ctagsNumericOptDelim ctagsOperator
highlight link ctagsNumericOption ctagsKeyword


"   --etags-include=file
"   --options=path
"   --options-maybe=path
"   --_anonhash=
"   --input-encoding=name
syntax match ctagsStringOptions /\v^\s*\-\-(etags-include|options(-maybe)?|_anonhash|input-encoding)>/ nextgroup=ctagsStringOptDelim
syntax match ctagsStringOptDelim /=/ contained nextgroup=ctagsStringOption
syntax match ctagsStringOption /\v\=@<=.+$/ contained

highlight link ctagsStringOptions ctagsStatement
highlight link ctagsStringOptDelim ctagsOperator
highlight link ctagsStringOption ctagsString


" --output-format=(u-ctags|e-ctags|etags|xref|json)
"
syntax match ctagsOutputFormat /\v^\s*\-\-output-format>/ nextgroup=ctagsOutputFormatDelim
syntax match ctagsOutputFormatDelim /=/ contained nextgroup=ctagsOutputFormatOption
syntax match ctagsOutputFormatOption /\v\=@<=([ue]-ctags|etags|xref|json)$/ contained

highlight link ctagsOutputFormat ctagsStatement
highlight link ctagsOutputFormatDelim ctagsOperator
highlight link ctagsOutputFormatOption ctagsKeyword


" --format=(1|2)
"
syntax match ctagsFormat /\v^\s*\-\-format>/ nextgroup=ctagsFormatDelim
syntax match ctagsFormatDelim /=/ contained nextgroup=ctagsFormatOption
syntax match ctagsFormatOption /\v\=@<=(1|2)$/ contained

highlight link ctagsFormat ctagsStatement
highlight link ctagsFormatDelim ctagsOperator
highlight link ctagsFormatOption ctagsKeyword



" --sort=(yes|no|foldcase)
"
syntax match ctagsSort /\v^\s*\-\-sort>/ nextgroup=ctagsSortDelim
syntax match ctagsSortDelim /=/ contained nextgroup=ctagsSortOption
syntax match ctagsSortOption /\v\=@<=(yes|no|foldcase)$/ contained

highlight link ctagsSort ctagsStatement
highlight link ctagsSortDelim ctagsOperator
highlight link ctagsSortOption ctagsKeyword


" --tag-relative=(yes|no|always|never)
"
syntax match ctagsTagRelative /\v^\s*\-\-tag-relative>\=@=/ nextgroup=ctagsTagRelativeDelim
syntax match ctagsTagRelativeDelim /=/ contained nextgroup=ctagsTagRelativeOption
syntax match ctagsTagRelativeOption /\v\=@<=(yes|no|alway|never)$/ contained

highlight link ctagsTagRelative ctagsStatement
highlight link ctagsTagRelativeDelim ctagsOperator
highlight link ctagsTagRelativeOption ctagsKeyword


" Per-language list commands:
"
"   --list-aliases[=(<language>|all)]
"   --list-extras[=(<language>|all)]
"   --list-fields[=(<language>|all)]
"   --list-kinds[=(<language>|all)]
"   --list-kinds-full[=(<language>|all)]
"   --list-map-extensions[=(<language>|all)]
"   --list-map-patterns[=(<language>|all)]
"   --list-maps[=(<language>|all)]
"   --list-params[=(<language>|all)]
"   --list-roles[=(<language>|all)[.(<kindspecs>|*)]]
"   --list-subparsers[=(<baselang>|all)]
syntax match ctagsLanguageList /\v^\s?\-\-list\-(aliases|extras|fields|kinds(-full)?|map-(extensions|patterns)|maps|params|roles|subparsers)>/ nextgroup=ctagsLanguageListDelim
syntax match ctagsLanguageListDelim /=/ contained nextgroup=ctagsLanguageListName
syntax match ctagsLanguageListName /\v\=@<=.*$/ contained contains=ctagsLanguageListAll
syntax match ctagsLanguageListAll /\v<all$/

highlight link ctagsLanguageList ctagsStatement
highlight link ctagsLanguageListDelim ctagsOperator
highlight link ctagsLanguageListName ctagsLanguageName
highlight link ctagsLanguageListAll ctagsOperator


" Version command (ctags version and language parser version)
"
"   --version
"   --version=NONE
"   --version=C++
syntax match ctagsVersion /\v\s*\-\-version\=@=/ nextgroup=ctagsVersionDelim
syntax match ctagsVersionDelim /=/ contained nextgroup=ctagsVersionLanguage
syntax match ctagsVersionLanguage /\v\=@<=.*$/ contained contains=ctagsVersionNone
syntax match ctagsVersionNone /\v\=@<=NONE$/ contained

highlight link ctagsVersion ctagsStatement
highlight link ctagsVersionDelim ctagsOperator
highlight link ctagsVersionLanguage ctagsLanguageName
highlight link ctagsVersionNone ctagsOperator


" Languages list (enable / disable)
"
"   --languages=+C,C++,-Vim
"   --languages=all
syntax match ctagsAllLanguageList /\v\s*\-\-languages\=@=/ nextgroup=ctagsAllLanguageListDelim
syntax match ctagsAllLanguageListDelim /=/ contained nextgroup=ctagsAllLanguageListOp
syntax match ctagsAllLanguageListOp /\v[=,]@<=[-+]?/ contained nextgroup=ctagsAllLanguageListName
syntax match ctagsAllLanguageListName '\v[-+,=]@<=(\w|\+|\#)+(\,|$)@=' contained contains=ctagsLangListALL nextgroup=ctagsAllLanguageListNameDelim
syntax match ctagsLangListAll /\v[-+,=]@<=all(\,|$)@=/ contained
syntax match ctagsAllLanguageListNameDelim /,/ contained nextgroup=ctagsAllLanguageListOp

highlight link ctagsAllLanguageList ctagsStatement
highlight link ctagsAllLanguageListDelim ctagsOperator
highlight link ctagsAllLanguageListOp ctagsOperation
highlight link ctagsAllLanguageListName ctagsLanguageName
highlight link ctagsLangListAll ctagsOperator
highlight link ctagsAllLanguageListNameDelim ctagsDelimiter

" Error fallback, show known syntax errors to the user if matched
"
syntax match ctagsErrorFallback /.*$/ contained

highlight link ctagsErrorFallback Error

" Comments
"	# comment line starting with #
"
syntax match ctagsComment /\v^\s*\#.*$/


" Message echo form .ctag files, for debugging
"
"	--_echo=message
"
syntax match ctagsEchoKeyword /\v^\s*\-\-_echo\=@=/ nextgroup=ctagsEchoDelimiter
syntax match ctagsEchoDelimiter /=/ contained nextgroup=ctagsEchoText
syntax match ctagsEchoText /\v\=@<=.*$/ contained

highlight link ctagsEchoKeyword ctagsStatement
highlight link ctagsEchoDelimiter ctagsOperator
highlight link ctagsEchoText ctagsDescription

" Language defintion
"
"	--langdef=Vim{long_flag}{long_flag=LANG}
"
syntax match ctagsLangDefKeyword /\v^\s*\-\-langdef/ nextgroup=ctagsLangDefDelimiter,ctagsErrorFallback
syntax match ctagsLangDefDelimiter /=/ contained nextgroup=ctagsLangDefName,ctagsErrorFallback
syntax match ctagsLangDefName /\v\=@<=[^={]+(\{@=|$)/ contained nextgroup=ctagsLangDefFlag,ctagsErrorFallback
syntax match ctagsLangDefFlag /\v\{\w+(\=([^\\}]|\\.)*)?\}/ contained keepend contains=ctagsListSelectorDelim,ctagsLangDefStandardFlags,ctagsLangDefExternalLangFlag,ctagsLangDefVersionFlag nextgroup=ctagsLangDefFlag,ctagsErrorFallback
syntax match ctagsLangDefStandardFlags /\v\{@<=(bidirectional|dedicated|shared|_autoFQTag)>/ contained nextgroup=ctagsLangDefStandardFlagsTrail,ctagsErrorFallback
syntax match ctagsLangDefStandardFlagsTrail /\v([^\\}]|\\.)*\}@=/ contained nextgroup=ctagsListSelectorDelim,ctagsErrorFallback
syntax match ctagsLangDefExternalLangFlag /\v\{@<=(base|_foreignLanguage)/ contained nextgroup=ctagsLangDefExternalLangDelim,ctagsErrorFallback
syntax match ctagsLangDefExternalLangDelim /=/ contained nextgroup=ctagsLangDefExternalLangName,ctagsErrorFallback
syntax match ctagsLangDefExternalLangName /\v([^\\}]|\\[\\}])*/ contained
syntax match ctagsLangDefVersionFlag /\v\{@<=version/ contained nextgroup=ctagsLangDefVersionFlagDelim,ctagsErrorFallback
syntax match ctagsLangDefVersionFlagDelim /=/ contained nextgroup=ctagsLangDefVersionFlagValue,ctagsErrorFallback
syntax match ctagsLangDefVersionFlagValue /\v.+\..+/ contained keepend contains=ctagsLangDefVersionFlagDigits
syntax match ctagsLangDefVersionFlagDigits /\v\d+/ contained

highlight link ctagsLangDefKeyword ctagsStatement
highlight link ctagsLangDefDelimiter ctagsOperator
highlight link ctagsLangDefName ctagsLanguageName
highlight link ctagsLangDefFlag ctagsGenericOptions
highlight link ctagsLangDefStandardFlags ctagsFlagName
highlight link ctagsLangDefStandardFlagsTrail ctagsErrorFallback
highlight link ctagsLangDefExternalLangFlag ctagsFlagName
highlight link ctagsLangDefExternalLangDelim ctagsOperator
highlight link ctagsLangDefExternalLangName ctagsLanguageName
highlight link ctagsLangDefVersionFlag ctagsFlagName
highlight link ctagsLangDefVersionFlagDelim ctagsOperator
highlight link ctagsLangDefVersionFlagValue ctagsFlagValueString
highlight link ctagsLangDefVersionFlagDigits ctagsFlagValueNumber


" Language map
"
"	--map-Lang=.vim
" 	--map-Lang=(.vimrc)
"
syntax match ctagsMapKeyword /\v^\s*\-\-map\-/ nextgroup=ctagsMapLanguage,ctagsErrorFallback
syntax match ctagsMapLanguage /\v\-@<=[^=]+\=@=/ contained nextgroup=ctagsMapDelim
syntax match ctagsMapDelim /=/ contained nextgroup=ctagsMapOp
syntax match ctagsMapOp /\v\=@<=[-+]?/ contained nextgroup=ctagsMapExtension,ctagsMapGlob
syntax match ctagsMapExtension /\v(\=[-+]?)@<=\..*$/ contains=ctagsMapExtensionDot
syntax match ctagsMapExtensionDot /\v(\=[-+]?)@<=\./ contained
syntax match ctagsMapGlob /\v(\=[-+]?)@<=\(.*\)$/ contains=ctagsMapGlobParen,ctagsMapGlobSpecial
syntax match ctagsMapGlobParen /\v((\=[-+]?)@<=\()|\)$/ contained
syntax match ctagsMapGlobSpecial /\v[*?]|\[(\]@!|.)*\]/ contained

highlight link ctagsMapKeyword ctagsStatement
highlight link ctagsMapLanguage ctagsLanguageName
highlight link ctagsMapDelim ctagsOperator
highlight link ctagsMapOp ctagsOperation
highlight link ctagsMapExtension ctagsString
highlight link ctagsMapExtensionDot ctagsOperation
highlight link ctagsMapGlob ctagsString
highlight link ctagsMapGlobParen ctagsOperation
highlight link ctagsMapGlobSpecial ctagsSpecial


" Scope separator for qualified tags
"
"   --_scopesep-<LANG>=[<parent_kind_letter>|*]/(<child_kind_letter>|*):<separator>
"
syntax match ctagsScopeSep /\v^\s*\-\-_scopesep\-/ nextgroup=ctagsScopeSepLang,ctagsErrorFallback
syntax match ctagsScopeSepLang /\v\-@<=[^=]+\=@=/ contained nextgroup=ctagsScopeSepDelim,ctagsErrorFallback
syntax match ctagsScopeSepDelim /=/ contained nextgroup=ctagsScopeSepKindLetter,ctagsErrorFallback
syntax match ctagsScopeSepKindLetter '\v\=@<=(\w|\*)?/@=' contained contains=ctagsScopeKindAll nextgroup=ctagsScopeSepChildKindDelim,ctagsErrorFallback
syntax match ctagsScopeKindAll '\*' contained
syntax match ctagsScopeSepChildKindDelim '/' contained nextgroup=ctagsScopeSepChildKindLetter,ctagsErrorFallback
syntax match ctagsScopeSepChildKindLetter '\v/@<=(\w|\*)\:@=' contained contains=ctagsScopeKindAll nextgroup=ctagsScopeSeparatorDelim,ctagsErrorFallback
syntax match ctagsScopeSeparatorDelim '\v(/(\a|\*))@<=\:' contained nextgroup=ctagsScopeSeparator,ctagsErrorFallback
syntax match ctagsScopeSeparator '.*$' contained

highlight link ctagsScopeSep ctagsStatement
highlight link ctagsScopeSepLang ctagsLanguageName
highlight link ctagsScopeSepDelim ctagsOperator
highlight link ctagsScopeSepKindLetter ctagsKindLetter
highlight link ctagsScopeSepChildKindDelim ctagsDelimiter
highlight link ctagsScopeSepChildKindLetter ctagsKindLetter
highlight link ctagsScopeSeparatorDelim ctagsOperation
highlight link ctagsScopeKindAll ctagsOperator
highlight link ctagsScopeSeparator ctagsString


" Role definition:
"
"   --_roledef-<LANG>.<kind>=<name>,<description>
"
syntax match ctagsRoleDef /\v^\s*\-\-_roledef\-/ nextgroup=ctagsRoleDefLang,ctagsErrorFallback
syntax match ctagsRoleDefLang /\v\-@<=[^=]+\.@=/ contained nextgroup=ctagsRoleDefKindDelimiter,ctagsErrorFallback
syntax match ctagsRoleDefKindDelimiter /\./ contained nextgroup=ctagsRoleDefKindLetter,ctagsRoleDefKindName,ctagsErrorFallback
syntax match ctagsRoleDefKindLetter /\v\.@<=\w\=@=/ contained nextgroup=ctagsRoleDefDelimiter,ctagsErrorFallback
syntax match ctagsRoleDefKindName /\v\.@<=\{\w+\}\=@=/ contained contains=ctagsListSelectorDelim nextgroup=ctagsRoleDefDelimiter,ctagsErrorFallback
syntax match ctagsRoleDefDelimiter /=/ contained nextgroup=ctagsRoleDefName,ctagsErrorFallback
syntax match ctagsRoleDefName /\v\=@<=\w+\,@=/ contained nextgroup=ctagsRoleDefDescDelimiter,ctagsErrorFallback
syntax match ctagsRoleDefDescDelimiter /,/ contained nextgroup=ctagsRoleDefDesc,ctagsErrorFallback
syntax match ctagsRoleDefDesc /\v\,@<=.*$/ contained

highlight link ctagsRoleDef ctagsStatement
highlight link ctagsRoleDefLang ctagsLanguageName
highlight link ctagsRoleDefKindDelimiter ctagsDelimiter
highlight link ctagsRoleDefKindLetter ctagsRoleLetter
highlight link ctagsRoleDefKindName ctagsKindName
highlight link ctagsRoleDefDelimiter ctagsOperator
highlight link ctagsRoleDefName ctagsRoleName
highlight link ctagsRoleDefDescDelimiter ctagsDelimiter
highlight link ctagsRoleDefDesc ctagsDescription


" Kind definition
"
"	--kinddef-Vim=K,name,description string
"
syntax match ctagsKindDef /\v^\s*\-\-kinddef\-/ nextgroup=ctagsKindDefLang,ctagsErrorFallback
syntax match ctagsKindDefLang /\v\-@<=[^=]+\=@=/ contained nextgroup=ctagsKindDefDelimiter,ctagsErrorFallback
syntax match ctagsKindDefDelimiter /=/ contained nextgroup=ctagsKindDefLetter,ctagsErrorFallback
syntax match ctagsKindDefLetter /\v\=@<=\w\,@=/ contained nextgroup=ctagsKindDefNameDelimiter,ctagsErrorFallback
syntax match ctagsKindDefNameDelimiter /\v(\=\w)@<=\,/ contained nextgroup=ctagsKindDefName,ctagsErrorFallback
syntax match ctagsKindDefName /\v(\=\w\,)@<=\w+\,@=/ contained nextgroup=ctagsKindDefDescDelimiter,ctagsErrorFallback
syntax match ctagsKindDefDescDelimiter /,/ contained nextgroup=ctagsKindDefDesc,ctagsErrorFallback
syntax match ctagsKindDefDesc /\v\,@<=.*$/ contained

highlight link ctagsKindDef ctagsStatement
highlight link ctagsKindDefLang ctagsLanguageName
highlight link ctagsKindDefLetter ctagsKindLetter
highlight link ctagsKindDefDelimiter ctagsOperator
highlight link ctagsKindDefNameDelimiter ctagsDelimiter
highlight link ctagsKindDefName ctagsKindName
highlight link ctagsKindDefDescDelimiter ctagsDelimiter
highlight link ctagsKindDefDesc ctagsDescription


" Kind list (enable / disable)
"
"   --kinds-Vim=-{kind}+K
"   --kinds-all=*
"
syntax match ctagsKindList /\v^\s*\-\-kinds\-/ nextgroup=ctagsKindListLang,ctagsErrorFallback
syntax match ctagsKindListLang /\v\-@<=[^=]+\=@=/ contained contains=ctagsLangALL nextgroup=ctagsKindListDelim,ctagsErrorFallback
syntax match ctagsLangALL /\v\-@<=all\=@=/ contained
syntax match ctagsKindListDelim /=/ contained nextgroup=ctagsKindListOp,ctagsKindListSelector,ctagsKindListLetters,ctagsErrorFallback
syntax match ctagsKindListOp /\v[-+]/ contained nextgroup=ctagsKindlistSelector,ctagsKindListLetters,ctagsErrorFallback
syntax match ctagsKindListLetters /\v[-=+}*]@<=\w+>/ contained nextgroup=ctagsKindListOp,ctagsKindListSelector,ctagsErrorFallback
syntax match ctagsKindListSelector /\v(\{\w+\}|\*)+/ contained contains=ctagsListSelectorDelim nextgroup=ctagsKindListOp,ctagsKindListLetters,ctagsErrorFallback
syntax match ctagsListSelectorDelim /\v[}{*]/ contained

highlight link ctagsKindList ctagsStatement
highlight link ctagsKindListLang ctagsLanguageName
highlight link ctagsLangALL ctagsOperator
highlight link ctagsKindListLetters ctagsKindLetter
highlight link ctagsKindListDelim ctagsOperator
highlight link ctagsKindListOp ctagsOperation
highlight link ctagsKindListSelector ctagsKindName
highlight link ctagsListSelectorDelim ctagsOperator


" Field defintion
"
"	--_fielddef-Vim={name},description string
"
syntax match ctagsFieldDef /\v^\s*\-\-_fielddef\-/ nextgroup=ctagsFieldDefLang,ctagsErrorFallback
syntax match ctagsFieldDefLang /\v\-@<=[^=]+\=@=/ contained nextgroup=ctagsFieldDefDelim,ctagsErrorFallback
syntax match ctagsFieldDefDelim /=/ contained nextgroup=ctagsFieldDefName,ctagsErrorFallback
syntax match ctagsFieldDefName /\v\=@<=\w+>\,@=/ contained nextgroup=ctagsFieldDefNameDelim
syntax match ctagsFieldDefNameDelim /,/ contained nextgroup=ctagsFieldDefDesc,ctagsErrorFallback
syntax match ctagsFieldDefDesc /\v\,@<=.*$/ contained

highlight link ctagsFieldDef ctagsStatement
highlight link ctagsFieldDefLang ctagsLanguageName
highlight link ctagsFieldDefDelim ctagsOperator
highlight link ctagsFieldDefName ctagsFieldName
highlight link ctagsFieldDefNameDelim ctagsDelimiter
highlight link ctagsFieldDefDesc ctagsDescription


" Extra defintion
"
"	--_extradef-Vim={name},description string
"
syntax match ctagsExtraDef /\v^\s*\-\-_extradef\-/ nextgroup=ctagsExtraDefLang,ctagsErrorFallback
syntax match ctagsExtraDefLang /\v\-@<=[^=]+\=@=/ contained nextgroup=ctagsExtraDefDelim,ctagsErrorFallback
syntax match ctagsExtraDefDelim /=/ contained nextgroup=ctagsExtraDefName,ctagsErrorFallback
syntax match ctagsExtraDefName /\v\=@<=\w+>\,@=/ contained nextgroup=ctagsExtraDefNameDelim
syntax match ctagsExtraDefNameDelim /,/ contained nextgroup=ctagsExtraDefDesc,ctagsErrorFallback
syntax match ctagsExtraDefDesc /\v\,@<=.*$/ contained

highlight link ctagsExtraDef ctagsStatement
highlight link ctagsExtraDefLang ctagsLanguageName
highlight link ctagsExtraDefDelim ctagsOperator
highlight link ctagsExtraDefName ctagsExtraName
highlight link ctagsExtraDefNameDelim ctagsDelimiter
highlight link ctagsExtraDefDesc ctagsDescription


" Param defintion
"
"	--_paramdef-Vim={name},description string
"
syntax match ctagsParamDef /\v^\s*\-\-_paramdef\-/ nextgroup=ctagsParamDefLang,ctagsErrorFallback
syntax match ctagsParamDefLang /\v\-@<=[^=]+\=@=/ contained nextgroup=ctagsParamDefDelim,ctagsErrorFallback
syntax match ctagsParamDefDelim /=/ contained nextgroup=ctagsParamDefName,ctagsErrorFallback
syntax match ctagsParamDefName /\v\=@<=\w+>\,@=/ contained nextgroup=ctagsParamDefNameDelim
syntax match ctagsParamDefNameDelim /,/ contained nextgroup=ctagsParamDefDesc,ctagsErrorFallback
syntax match ctagsParamDefDesc /\v\,@<=.*$/ contained

highlight link ctagsParamDef ctagsStatement
highlight link ctagsParamDefLang ctagsLanguageName
highlight link ctagsParamDefDelim ctagsOperator
highlight link ctagsParamDefName ctagsParamName
highlight link ctagsParamDefNameDelim ctagsDelimiter
highlight link ctagsParamDefDesc ctagsDescription


" Param value
"
"   --param-<LANG>.<name>=<argument>
"
syntax match ctagsParam /\v^\s*\-\-param\-/ nextgroup=ctagsParamLang,ctagsErrorFallback
syntax match ctagsParamLang /\v\-@<=[^.=]+\.@=/ contained nextgroup=ctagsParamNameDelim,ctagsErrorFallback
syntax match ctagsParamNameDelim /\./ contained nextgroup=ctagsParamName,ctagsErrorFallback
syntax match ctagsParamName /\v\.@<=\w+>\=@=/ contained nextgroup=ctagsParamDelim,ctagsErrorFallback
syntax match ctagsParamDelim /=/ contained nextgroup=ctagsParamArgument,ctagsErrorFallback
syntax match ctagsParamArgument /\v\=@<=.*$/ contained

highlight link ctagsParam ctagsStatement
highlight link ctagsParamLang ctagsLanguageName
highlight link ctagsParamNameDelim ctagsDelimiter
highlight link ctagsParamName ctagsParamName
highlight link ctagsParamDelim ctagsOperator
highlight link ctagsParamArgument ctagsString


" Field list (enable / disable)
"
"   --fields-Vim=+F-{field}{name}
"   --fields-all=*
"
syntax match ctagsFieldListGlobal /\v^\s*\-\-fields\=@=/ nextgroup=ctagsFieldListDelim,ctagsErrorFallback
syntax match ctagsFieldList /\v^\s*\-\-fields\-/ nextgroup=ctagsFieldListLang,ctagsErrorFallback
syntax match ctagsFieldListLang /\v\-@<=[^=]+\=@=/ contained contains=ctagsLangALL nextgroup=ctagsFieldListDelim,ctagsErrorFallback
syntax match ctagsFieldListDelim /=/ contained nextgroup=ctagsFieldListOp,ctagsFieldListLetters,ctagsFieldListSelector,ctagsErrorFallback
syntax match ctagsFieldListOp /\v[-+]/ contained nextgroup=ctagsFieldListLetters,ctagsFieldListSelector
syntax match ctagsFieldListLetters /\v[-=+}*]@<=\w+>/ contained nextgroup=ctagsFieldListOp,ctagsFieldListSelector,ctagsErrorFallback
syntax match ctagsFieldListSelector /\v(\{\w+\}|\*)+/ contained contains=ctagsListSelectorDelim nextgroup=ctagsFieldListOp,ctagsFieldListLetters,ctagsErrorFallback

highlight link ctagsFieldList ctagsStatement
highlight link ctagsFieldListGlobal ctagsStatement
highlight link ctagsFieldListDelim ctagsOperator
highlight link ctagsFieldListLang ctagsLanguageName
highlight link ctagsFieldListOp ctagsOperation
highlight link ctagsFieldListLetters ctagsFieldLetter
highlight link ctagsFieldListSelector ctagsFieldName


" Extras list (enable / disable)
"
"   --extras=+I{imported}
"   --extras-Vim=-{sourced}
"   --extras-all=*
syntax match ctagsExtraListGlobal /\v^\s*\-\-extras\=@=/ nextgroup=ctagsExtraListDelim,ctagsErrorFallback
syntax match ctagsExtraList /\v^\s*\-\-extras\-/ nextgroup=ctagsExtraListLang,ctagsErrorFallback
syntax match ctagsExtraListLang /\v\-@<=[^=]+\=@=/ contained contains=ctagsLangALL nextgroup=ctagsExtraListDelim,ctagsErrorFallback
syntax match ctagsExtraListDelim /=/ contained nextgroup=ctagsExtraListOp,ctagsExtraListLetters,ctagsExtraListSelector,ctagsErrorFallback
syntax match ctagsExtraListOp /\v[-+]/ contained nextgroup=ctagsExtraListLetters,ctagsExtraListSelector,ctagsErrorFallback
syntax match ctagsExtraListLetters /\v[-=+}*]@<=\w+>/ contained nextgroup=ctagsExtraListOp,ctagsExtraListSelector,ctagsErrorFallback
syntax match ctagsExtraListSelector /\v(\{\w+\}|\*)+/ contained contains=ctagsListSelectorDelim nextgroup=ctagsExtraListOp,ctagsExtraListLetters,ctagsErrorFallback

highlight link ctagsExtraList ctagsStatement
highlight link ctagsExtraListGlobal ctagsStatement
highlight link ctagsExtraListLang ctagsLanguageName
highlight link ctagsExtraListDelim ctagsOperator
highlight link ctagsExtraListOp ctagsOperation
highlight link ctagsExtraListLetters ctagsExtraLetter
highlight link ctagsExtraListSelector ctagsExtraName

" if !!len(globpath(&runtimepath, 'syntax/postscr.vim', v:false, v:true))
"     syntax include @ctagsGhostscriptSyntax syntax/postscr.vim
"     unlet b:current_syntax
"     syn case match
" endif


" Optscript (Ghostscript) global code blocks
"
"   --_prelude-<LANG>={{
"         OPTSCRIPT CODE FRAGMENTS
" }}
"
" --_sequel-<LANG>={{
"         OPTSCRIPT CODE FRAGMENTS
" }}
syntax match ctagsOptscriptCode /\v^\s*\-\-_(prelude|sequel)\-/ nextgroup=ctagsOptscriptCodeLang,ctagsErrorFallback
syntax match ctagsOptscriptCodeLang /\v\-@<=[^=]+\=@=/ contained nextgroup=ctagsOptscriptCodeDelim,ctagsErrorFallback
syntax match ctagsOptscriptCodeDelim /=/ contained nextgroup=ctagsOpotScriptCodeBlock
syntax region ctagsOpotScriptCodeBlock start=/\v\{\{$/ end=/\v^\}\}$/ contained keepend contains=@ctagsGhostscriptSyntax

highlight link ctagsOptscriptCode ctagsStatement
highlight link ctagsOptscriptCodeLang ctagsLanguageName
highlight link ctagsOptscriptCodeDelim ctagsOperator

" Table defintion (for mtable parsers)
"
"   --_tabledef-vim=name
"
syntax match ctagsTableDef /\v^\s*\-\-_tabledef\-/ nextgroup=ctagsTableDefLang,ctagsErrorFallback
syntax match ctagsTableDefLang /\v\-@<=[^=]+\=@=/ contained nextgroup=ctagsTableDefDelim,ctagsErrorFallback
syntax match ctagsTableDefDelim /=/ contained nextgroup=ctagsTableDefName,ctagsErrorFallback
syntax match ctagsTableDefName /\v\=@<=\w+$/ contained

highlight link ctagsTableDef ctagsStatement
highlight link ctagsTableDefLang ctagsLanguageName
highlight link ctagsTableDefDelim ctagsOperator
highlight link ctagsTableDefName ctagsTableName


" Table extend
"
"   --_mtable-extend-Vim=dest+source
"
syntax match ctagsTableExtend /\v^\s*\-\-_mtable-extend-/ nextgroup=ctagsTableExtendLang,ctagsErrorFallback
syntax match ctagsTableExtendLang /\v\-@<=[^=]+\=@=/ contained nextgroup=ctagsTableExtendDelim,ctagsErrorFallback
syntax match ctagsTableExtendDelim /=/ contained nextgroup=ctagsTableExtendDest,ctagsErrorFallback
syntax match ctagsTableExtendDest /\v\=@<=\w+\+@=/ contained nextgroup=ctagsTableExtendSourceDelim,ctagsErrorFallback
syntax match ctagsTableExtendSourceDelim /+/ contained nextgroup=ctagsTableExtendSource,ctagsErrorFallback
syntax match ctagsTableExtendSource /\v\+@<=\w+$/ contained

highlight link ctagsTableExtend ctagsStatement
highlight link ctagsTableExtendLang ctagsLanguagename
highlight link ctagsTableExtendDelim ctagsOperator
highlight link ctagsTableExtendDest ctagsTableName
highlight link ctagsTableExtendSourceDelim ctagsOperation
highlight link ctagsTableExtendSource ctagsTableName


" Regular expression flags
"
syntax match ctagsBackreference '\v([^\\](\\\\)*)@<=\\[0-9]>'
syntax match ctagsRegexShortStandardFlags /[bepi]/ contained
syntax cluster ctagsRegexKnownLongFlags contains=ctagsRegexStandardFlags,ctagsRegexMessageFlag,ctagsRegexMessageFlag,ctagsRegexAnonymousFlag,ctagsRegexExtraFlag,ctagsRegexFieldFlag,ctagsRegexGuestFlag,ctagsRegexLangFlag,ctagsRegexRoleFlag
syntax match ctagsRegexStandardFlags /\v\{@<=(basic|extended|pcre2|icase|placeholder)>/ contained nextgroup=ctagsStandardFlagsTrail,ctagsErrorFallback
syntax match ctagsStandardFlagsTrail /\v([^\\}]|\\.)*\}@=/ contained nextgroup=ctagsListSelectorDelim,ctagsErrorFallback

syntax match ctagsRegexScopeFlag /\v\{@<=scope>/ contained nextgroup=ctagsRegexScopeFlagDelim,ctagsErrorFallback
syntax match ctagsRegexScopeFlagDelim /=/ contained nextgroup=ctagsRegexScopeFlagValue,ctagsErrorFallback
syntax match ctagsRegexScopeFlagValue /\v\=@<=([^\\}]|\\.)*\}@=/ contained contains=ctagsRegexScopeFlagValues nextgroup=ctagsListSelectorDelim,ctagsErrorFallback
syntax match ctagsRegexScopeFlagValues /\v\=@<=(push|pop|ref|clear|set|replace|intervaltab)\}@=/ contained

syntax match ctagsRegexMessageFlag /\v\{@<=(fatal|warning)>/ contained nextgroup=ctagsRegexMessageFlagDelim,ctagsErrorFallback
syntax match ctagsRegexMessageFlagDelim /=/ contained nextgroup=ctagsRegexMessageFlagString
syntax match ctagsRegexMessageFlagString /\v\=@<=([^\\}]|\\.)*\}@=/ contained contains=ctagsBackreference nextgroup=ctagsListSelectorDelim

syntax match ctagsRegexAnonymousFlag /\v\{@<=_anonymous>/ contained nextgroup=ctagsRegexAnonymousFlagDelim,ctagsErrorFallback
syntax match ctagsRegexAnonymousFlagDelim /=/ contained nextgroup=ctagsRegexAnonymousFlagPrefix
syntax match ctagsRegexAnonymousFlagPrefix /\v\=@<=([^\\}]|\\.)*\}@=/ contained nextgroup=ctagsListSelectorDelim,ctagsErrorFallback

syntax match ctagsRegexExtraFlag /\v\{@<=_extra>/ contained nextgroup=ctagsRegexExtraFlagDelim,ctagsErrorFallback
syntax match ctagsRegexExtraFlagDelim /=/ contained nextgroup=ctagsRegexExtraFlagName,ctagsErrorFallback
syntax match ctagsRegexExtraFlagName /\v\=@<=\w+\}@=/ contained nextgroup=ctagsListSelectorDelim,ctagsErrorFallback

syntax match ctagsRegexFieldFlag /\v\{@<=_field>/ contained nextgroup=ctagsRegexFieldFlagDelim,ctagsErrorFallback
syntax match ctagsRegexFieldFlagDelim /=/ contained nextgroup=ctagsRegexFieldFlagName,ctagsErrorFallback
syntax match ctagsRegexFieldFlagName /\v\=@<=(\w|\\\d)+\:@=/ contained contains=ctagsBackreference nextgroup=ctagsRegexFieldValueDelim,ctagsErrorFallback
syntax match ctagsRegexFieldValueDelim /:/ contained nextgroup=ctagsRegexFieldValue,ctagsListSelectorDelim,ctagsErrorFallback
syntax match ctagsRegexFieldValue /\v\:@<=([^\\}]|\\.)*\}@=/ contained contains=ctagsBackreference nextgroup=ctagsListSelectorDelim,ctagsErrorFallback

syntax match ctagsRegexGuestFlag /\v\{@<=_guest>/ contained nextgroup=ctagsRegexGuestFlagDelim,ctagsErrorFallback
syntax match ctagsRegexGuestFlagDelim /=/ contained nextgroup=ctagsRegexGuestFlagName,ctagsErrorFallback
syntax match ctagsRegexGuestFlagName /\v\=@<=[^,]+\,@=/ contained contains=ctagsBackreference,ctagsGuestBackreference nextgroup=ctagsRegexGuestFlagStartPosDelim,ctagsErrorFallback
syntax match ctagsGuestBackreference /\v\*\d/ contained
syntax match ctagsRegexGuestFlagStartPosDelim /,/ contained nextgroup=ctagsRegexGuestFlagStartPos,ctagsErrorFallback
syntax match ctagsRegexGuestFlagStartPos /\v\,@<=\d(start|end)\,@=/ contained contains=ctagsRegexGuestFlagPosIndex nextgroup=ctagsRegexGuestFlagEndPosDelim,ctagsErrorFallback
syntax match ctagsRegexGuestFlagEndPosDelim /,/ contained nextgroup=ctagsRegexGuestFlagEndPos,ctagsErrorFallback
syntax match ctagsRegexGuestFlagEndPos /\v\,@<=\d(start|end)\}@=/ contained contains=ctagsRegexGuestFlagPosIndex nextgroup=ctagsListSelectorDelim,ctagsErrorFallback
syntax match ctagsRegexGuestFLagPosIndex /\v\d/ contained

syntax match ctagsRegexLangFlag /\v\{@<=_language>/ contained nextgroup=ctagsRegexLangFlagDelim,ctagsErrorFallback
syntax match ctagsRegexLangFlagDelim /=/ contained nextgroup=ctagsRegexLangFlagName,ctagsErrorFallback
syntax match ctagsRegexLangFlagName /\v\=@<=([^\\}]|\\.)*\}@=/ contained contains=ctagsBackreference nextgroup=ctagsListSelectorDelim,ctagsErrorFallback

syntax match ctagsRegexRoleFlag /\v\{@<=_role>/ contained nextgroup=ctagsRegexRoleFlagDelim,ctagsErrorFallback
syntax match ctagsRegexRoleFlagDelim /=/ contained nextgroup=ctagsRegexRoleFlagName,ctagsErrorFallback
syntax match ctagsRegexRoleFlagName /\v\=@<=\w+\}@=/ contained contains=ctagsBackreference nextgroup=ctagsListSelectorDelim,ctagsErrorFallback

syntax match ctagsMRegexMGroupFlag /\v\{@<=mgroup>/ contained nextgroup=ctagsMRegexMGroupFlagDelim,ctagsErrorFallback
syntax match ctagsMRegexMGroupFlagDelim /=/ contained nextgroup=ctagsMRegexMGroupFlagValue,ctagsErrorFallback
syntax match ctagsMRegexMGroupFlagValue /\v\=@<=\d\}@=/ contained nextgroup=ctagsListSelectorDelim,ctagsErrorFallback

syntax match ctagsMRegexAdvanceFlag /\v\{@<=_advanceTo>/ contained nextgroup=ctagsMRegexAdvanceFlagDelim,ctagsErrorFallback
syntax match ctagsMRegexAdvanceFlagDelim /=/ contained nextgroup=ctagsMRegexAdvanceFlagPosition,ctagsErrorFallback
syntax match ctagsMRegexAdvanceFlagPosition /\v\=@<=\d(start|end)\}@=/ contained contains=ctagsMRegexAdvanceFlagPositionIndex nextgroup=ctagsListSelectorDelim,ctagsErrorFallback
syntax match ctagsMRegexAdvanceFlagPositionIndex /\d/ contained

highlight link ctagsBackreference ctagsRegexpCharClass
highlight link ctagsRegexShortStandardFlags ctagsFlagNameLetter
highlight link ctagsRegexStandardFlags ctagsFlagName
highlight link ctagsStandardFlagsTrail ctagsErrorFallback
highlight link ctagsRegexScopeFlag ctagsFlagName
highlight link ctagsRegexScopeFlagDelim ctagsOperator
highlight link ctagsRegexScopeFlagValue ctagsGenericOptions
highlight link ctagsRegexScopeFlagValues ctagsFlagValueEnum
highlight link ctagsRegexMessageFlag ctagsFlagName
highlight link ctagsRegexMessageFlagDelim ctagsOperator
highlight link ctagsRegexMessageFlagString ctagsDescription
highlight link ctagsRegexAnonymousFlag ctagsFlagName
highlight link ctagsRegexAnonymousFlagDelim ctagsOperator
highlight link ctagsRegexAnonymousFlagPrefix ctagsTagName
highlight link ctagsRegexExtraFlag ctagsFlagName
highlight link ctagsRegexExtraFlagDelim ctagsOperator
highlight link ctagsRegexExtraFlagName ctagsExtraName
highlight link ctagsRegexFieldFlag ctagsFlagName
highlight link ctagsRegexFieldFlagDelim ctagsOperator
highlight link ctagsRegexFieldFlagName ctagsFieldName
highlight link ctagsRegexFieldValueDelim ctagsDelimiter
highlight link ctagsRegexFieldValue ctagsFlagValueString
highlight link ctagsRegexGuestFlag ctagsFlagName
highlight link ctagsRegexGuestFlagDelim ctagsOperator
highlight link ctagsRegexGuestFlagName ctagsLanguageName
highlight link ctagsGuestBackreference ctagsRegexpCharClass
highlight link ctagsRegexGuestFlagStartPosDelim ctagsDelimiter
highlight link ctagsRegexGuestFlagStartPos ctagsFlagValueEnum
highlight link ctagsRegexGuestFlagEndPosDelim ctagsDelimiter
highlight link ctagsRegexGuestFlagendPos ctagsFlagValueEnum
highlight link ctagsRegexGuestFlagPosIndex ctagsFlagValueNumber
highlight link ctagsRegexLangFlag ctagsFlagName
highlight link ctagsRegexLangFlagDelim ctagsOperator
highlight link ctagsRegexLangFlagName ctagsLanguageName
highlight link ctagsRegexRoleFlag ctagsFlagName
highlight link ctagsRegexRoleFlagDelim ctagsOperator
highlight link ctagsRegexRoleFlagName ctagsRoleName
highlight link ctagsMRegexMGroupFlag ctagsFlagName
highlight link ctagsMRegexMGroupFlagDelim ctagsOperator
highlight link ctagsMRegexMGroupFlagValue ctagsFlagValueNumber
highlight link ctagsMRegexAdvanceFlag ctagsFlagName
highlight link ctagsMRegexAdvanceFlagDelim ctagsDelimiter
highlight link ctagsMRegexAdvanceFlagPosition ctagsFlagValueEnum
highlight link ctagsMRegexAdvanceFlagPositionIndex ctagsRegexpCharClass


" Multi-table regexp line
"
"   --_mtable-regex-vim=table_name/LINE_PATTERN/tag_name/K,name,kind description/LONGFLAGS
"
syntax match ctagsMTable /\v^\s*\-\-_mtable-regex\-/ nextgroup=ctagsMTableLang,ctagsErrorFallback
syntax match ctagsMTableLang /\v\-@<=[^=]+\=@=/ contained nextgroup=ctagsMTableDelim,ctagsErrorFallback
syntax match ctagsMTableDelim /=/ contained nextgroup=ctagsMTableName,ctagsErrorFallback,ctagsErrorFallback
syntax match ctagsMTableName '\v\=@<=\w+>/@=' contained nextgroup=ctagsMTableRegexpDelim,ctagsErrorFallback
syntax match ctagsMTableRegexpDelim '/' contained nextgroup=ctagsMTableExtendedRegexp,ctagsMTableBasicRegexp,ctagsMTablePcreRegexp,ctagsErrorFallback
syntax match ctagsMTableExtendedRegexp '\v/@<=%([^\\/]|\\.)+%(%(/%([^\\/]|\\.)*){2}/%(%([bp]@!\w)|(\{%(basic|pcre[0-9]?)\})@!\{%(\w+%(\=%([^/}]|\\/|\\})+)?)\})*(\{\{)?$)@=' contained keepend contains=@ctagsPosixExtendedRegexp nextgroup=ctagsMTableTagDelim,ctagsErrorFallback
syntax match ctagsMTableBasicRegexp '\v/@<=%([^\\/]|\\.)+%(%(/%([^\\/]|\\.)*){2}/%(%(\{%(\w+%(\=%([^\\/}]|\\.|\\})+)?)\}|\w+)*(\{basic\}|b)%(\{%(\w+%(\=%([^/}]|\\/|\\})+)?)\}|\w+)*(\{\{)?$))@=' contained keepend contains=@ctagsBasicRegexp nextgroup=ctagsMTableTagDelim,ctagsErrorFallback
syntax match ctagsMTablePcreRegexp '\v/@<=%([^\\/]|\\.)+%(%(/%([^\\/]|\\.)*){2}/%(%(\{%(\w+%(\=%([^\\/}]|\\.|\\})+)?)\}|\w+)*(\{pcre[0-9]?\}|p)%(\{%(\w+%(\=%([^/}]|\\/|\\})+)?)\}|\w+)*(\{\{)?$))@=' contained keepend contains=@ctagsPcreRegexp nextgroup=ctagsMTableTagDelim,ctagsErrorFallback
syntax match ctagsMTableTagDelim '/' contained nextgroup=ctagsMTableTag,ctagsErrorFallback
syntax match ctagsMTableTag '\v/@<=([^\\/]|\\.)*/@=' contained contains=ctagsBackreference nextgroup=ctagsMTableKindDelim,ctagsErrorFallback
syntax match ctagsMTableKindDelim '/' contained nextgroup=ctagsMTableKind,ctagsErrorFallback
syntax match ctagsMTableKind '\v/@<=([^\\/]|\\.)*/@=' contained keepend contains=ctagsMTableKindLetter,ctagsErrorFallback nextgroup=ctagsMTableFlagsDelim,ctagsErrorFallback
syntax match ctagsMTableKindLetter '\v/@<=\w[,/]@=' contained nextgroup=ctagsMTableKindNameDelim
syntax match ctagsMTableKindNameDelim '\v(/\w)@<=\,' contained nextgroup=ctagsMTableKindName
syntax match ctagsMTableKindName '\v(/\w\,)@<=\w+[,/]@=' contained nextgroup=ctagsMTableKindDescDelim
syntax match ctagsMTableKindDescDelim ',' contained nextgroup=ctagsMTableKindDesc
syntax match ctagsMTableKindDesc '\v\,@<=.*' contained
syntax match ctagsMTableFlagsDelim '/' contained nextgroup=ctagsMTableFlags,ctagsErrorFallback
syntax match ctagsMTableFlags '\v/@<=([^\\/]|\\.)*$' contained contains=ctagsMTableShortFlags,ctagsMTableLongFlags,ctagsMTableScriptBlock,ctagsErrorFallback nextgroup=ctagsMTableFlags,ctagsErrorFallback
syntax region ctagsMTableScriptBlock start=/\v\{\{$/ end=/\v^\}\}$/ contained keepend contains=@ctagsGhostscriptSyntax
syntax match ctagsMTableShortFlags /\w/ contained contains=ctagsMTableShortErrorFlags,@ctagsMTableShortStandardFlags
syntax match ctagsMTableShortErrorFlags /x/ contained
syntax cluster ctagsMTableShortStandardFlags contains=ctagsRegexShortStandardFlags
syntax match ctagsMTableLongFlags /\v\{\w+(\=([^\\}]|\\.)*)?\}/ contained keepend contains=ctagsListSelectorDelim,@ctagsMTableKnownLongFlags
syntax cluster ctagsMTableKnownLongFlags contains=@ctagsRegexKnownLongFlags,ctagsMTableLongErrorFlags,ctagsMTableStandardFlags,ctagsRegexScopeFlag,ctagsMRegexMGroupFlag,ctagsMRegexAdvanceFlag,ctagsMTableTEnterFlag,ctagsMTableTOperationFlag
syntax match ctagsMTableLongErrorFlags /\v\{@<=postrun(\=([^\\}]|\\.)*)?\}@=/ contained
syntax match ctagsMTableStandardFlags /\v\{@<=(tleave|tquit)>/ contained nextgroup=ctagsStandardFlagsTrail,ctagsErrorFallback
syntax match ctagsMTableTEnterFlag /\v\{@<=tenter>/ contained nextgroup=ctagsMTableTEnterFlagDelim,ctagsErrorFallback
syntax match ctagsMTableTEnterFlagDelim /=/ contained nextgroup=ctagsMTableTEnterFlagName,ctagsErrorFallback
syntax match ctagsMTableTEnterFlagName /\v\=@<=\w+>/ contained nextgroup=ctagsMTableTEnterFlagContDelim,ctagsListSelectorDelim,ctagsErrorFallback
syntax match ctagsMTableTEnterFlagContDelim /,/ contained nextgroup=ctagsMTableTEnterFlagCont,ctagsErrorFallback
syntax match ctagsMTableTEnterFlagCont /\v\,@<=.*/ contained
syntax match ctagsMTableTOperationFlag /\v\{@<=(tjump|treset)>/ contained nextgroup=ctagsMTableTOperationFlagDelim,ctagsErrorFallback
syntax match ctagsMTableTOperationFlagDelim /=/ contained nextgroup=ctagsMTableTOperationFlagName,ctagsErrorFallback
syntax match ctagsMTableTOperationFlagName /\v\=@<=\w+\}@=/ contained nextgroup=ctagsListSelectorDelim,ctagsErrorFallback

highlight link ctagsMTable ctagsStatement
highlight link ctagsMTableLang ctagsLanguageName
highlight link ctagsMTableDelim ctagsOperator
highlight link ctagsMTableName ctagsTableName
highlight link ctagsMTableRegexpDelim ctagsOperation
highlight link ctagsMTableBasicRegexp ctagsBasicRegexp
highlight link ctagsMTableExtendedRegexp ctagsExtendedRegexp
highlight link ctagsMTablePcreRegexp ctagsPcreRegexp
highlight link ctagsMTableTag ctagsTagName
highlight link ctagsMTableTagDelim ctagsOperation
highlight link ctagsMTableKindDelim ctagsOperation
highlight link ctagsMTableKindLetter ctagsKindLetterSpecial
highlight link ctagsMTableKindNameDelim ctagsDelimiter
highlight link ctagsMTableKindName ctagsKindName
highlight link ctagsMTableKindDescDelima ctagsDelimiter
highlight link ctagsMTableKindDesc ctagsDescription
highlight link ctagsMTableFlags ctagsGenericOptions
highlight link ctagsMTableFlagsDelim ctagsOperation
highlight link ctagsMTableShortFlags ctagsGenericOptions
highlight link ctagsMTableShortErrorFlags ctagsErrorFallback
highlight link ctagsMTableLongFlags ctagsGenericOptions
highlight link ctagsMTableLongErrorFlags ctagsErrorFallback
highlight link ctagsMTableStandardFlags ctagsFlagName
highlight link ctagsMTableTEnterFlag ctagsFlagName
highlight link ctagsMTableTEnterFlagDelim ctagsOperator
highlight link ctagsMTableTEnterFlagName ctagsTableName
highlight link ctagsMTableTEnterFlagContDelim ctagsDelimiter
highlight link ctagsMTableTEnterFlagCont ctagsFlagValueString
highlight link ctagsMTableTOperationFlag ctagsFlagName
highlight link ctagsMTableTOperationFlagDelim ctagsOperator
highlight link ctagsMTableTOperationFlagName ctagsTableName

if exists('b:ctags_syntax_show_regexp') && !!b:ctags_syntax_show_regexp || !exists('b:ctags_syntax_show_regexp') && exists('g:ctags_syntax_show_regexp') && !!g:ctags_syntax_show_regexp
    " POSIX Basic Regexp syntax
    syntax match ctagsBadRegexpEscape /\v\\n/ contained
    highlight link ctagsBadRegexpEscape ctagsErrorFallback

    " POSIX Extended Regexp syntax

    syntax match ctagsRegexpEscapes '\v\\[nt\/]' contained
    syntax match ctagsRegexpGnuCharClass /\v\\[wsWS]/ contained
    syntax match ctagsRegexpGnuBackreference /\v\\[1-9]/ contained
    syntax match ctagsRegexpGnuAnchor /\v\\[\>\<bB\`\']/ contained
    syntax match ctagsEreAnyChar /\v\./ contained
    syntax match ctagsEreQuotedChar /\v\\[\\^.[$()|*+?{]/ contained
    syntax match ctagsEreBadEscape /\v\\[nt\/wsWS><bB`'\\^.[$()|*+?{1-9]@!/ contained
    syntax match ctagsEreBadQuantifier /\v(^|[|^$(])@<=[*+?{]/ contained
    syntax match ctagsEreBadQuantifierAtStart /\v((\w|\=)\/)@<=[*+?{]?/ contained
    syntax match ctagsEreBadAnchor '\v(\||\(|(\w|\=)\/)@<!\^' contained
    syntax match ctagsEreBadAnchor '\v\$(\\n|\)|\||\/)@!' contained
    syntax match ctagsEreAnchor '\v(\||\(|\w\/)@<=\^' contained
    syntax match ctagsEreAnchor '\v\$(\\n|\)|\|\/)@=' contained
    syntax match ctagsEreGroupStart /\v\(@=/ contained nextgroup=ctagsEreGroup
    syntax region ctagsEreGroup contained start=/\v\(/ end=/\v\)/ contains=@ctagsPosixExtendedRegexpGroup,ctagsEreLiteral
    syntax match ctagsEreQuantifiedLiteral /\v[^|^$(\\[\]){}.]([*?+]|\{\d+(\,\d*)?\})/ contained
    syntax match ctagsErePlainQuantfier /\v(^|[|^$(])@<![*?+]|\{\d+(\,\d*)?\}/ contained
    syntax match ctagsEreLiteral /\v[^\\^[\]()|?+*{}.$]+[*?+{]@!/ contained
    syntax match ctagsEreAlternate /\v\|/ contained
    syntax match ctagsEreBadGroup /\v\)/ contained
    syntax region ctagsEreBracket matchgroup=ctagsEreBracketGroup start=/\v\[\^?\]?/ end=/\v\]/ contained contains=ctagsRegexpEscapes,ctagsEreBracketCollation,ctagsEreBracketEquivalence,ctagsEreBracketClass,ctagsEreBracketRange,ctagsEreBracketLiteral
    syntax region ctagsEreBracketCollation matchgroup=ctagsRegexpQuoted start=/\v\[\./ end=/\v\.\]/ contained keepend
    syntax region ctagsEreBracketEquivalence matchgroup=ctagsRegexpQuoted start=/\v\[\=/ end=/\v\=\]/ contained keepend
    syntax match ctagsEreBracketClass /\v\[\:\w+\:\]/ contained contains=ctagsEreBracketClassName
    syntax match ctagsEreBracketClassName /\v<\w+>/ contained contains=ctagsEreBracketClassNames
    syntax match ctagsEreBracketClassNames /\v<(alnum|alpha|blank|cntrl|digit|graph|lower|print|punct|space|upper|xdigit)>/ contained
    syntax match ctagsEreBracketRange /\v([^\]]|((\[\:\w+\:|\[\=([^=]|\=[^\]])+\=)@<!\])@<=)\-([^[]|(\]|\[\:\w+\:\]|\[\=([^=]|\=[^\]])+\=\])@!)/ contained contains=ctagsEreBracketRangeOp
    syntax match ctagsEreBracketRangeOp /\v([^\]]|(\[\:\w+\:|\[\=([^=]|\=[^\]])+\=)@<!\])@<=\-([^[]|(\]|\[\:\w+\:\]|\[\=([^=]|\=[^\]])+\=\])@!)@=/ contained
    syntax match ctagsEreBracketLiteral /\v([^\[-]|\[[:=.]@!)(-[^\]])@!/ contained
    syntax match ctagsEreBracketLiteral /\v(\[\:\w+\:\]|\[\=([^=]|\=[^\]])+\=\])@<=\-[^\]]?/ contained
    syntax match ctagsEreBracketLiteral /\v[^\]]?\-(\]|\[\:\w+\:\]|\[\=([^=]|\=[^\]])+\=\])@=/ contained

    syntax cluster ctagsPosixExtendedRegexpGroup add=ctagsEreQuotedChar,ctagsRegexpEscapes,ctagsEreBadQuantifier,ctagsEreBadQuantifierStart,ctagsEreBadAnchor,ctagsEreAnyChar,ctagsEreAnchor
    syntax cluster ctagsPosixExtendedRegexpGroup add=ctagsRegexpGnuCharClass,ctagsRegexpGnuBackreference,ctagsRegexpGnuAnchor,ctagsEreBadEscape,ctagsEreBadOp,ctagsEreOp,ctagsEreAlternate
    syntax cluster ctagsPosixExtendedRegexpGroup add=ctagsEreBracket,ctagsEreGroupStart,ctagsEreQuantifiedLiteral,ctagsErePlainQuantfier

    syntax cluster ctagsPosixExtendedRegexp add=@ctagsPosixExtendedRegexpGroup,ctagsEreBadGroup

    if exists('b:ctags_syntax_show_regexp') && b:ctags_syntax_show_regexp > 0 || !exists('b:ctags_syntax_show_regexp') && exists('g:ctags_syntax_show_regexp') && g:ctags_syntax_show_regexp > 0
	highlight link ctagsRegexpEscapes ctagsRegexpQuoted
	highlight link ctagsRegexpGnuCharClass ctagsRegexpCharClass
	highlight link ctagsRegexpGnuBackreference ctagsRegexpCharClass
	highlight link ctagsRegexpGnuAnchor ctagsRegexpOperator
	highlight link ctagsEreQuotedChar SpecialChar
	highlight link ctagsEreBadEscape ctagsErrorFallback
	highlight link ctagsEreBadQuantifier ctagsErrorFallback
	highlight link ctagsEreBadQuantifierStart ctagsErrorFallback
	highlight link ctagsEreBadAnchor ctagsErrorFallback
	highlight link ctagsEreAnyChar ctagsRegexpOperation
	highlight link ctagsEreAnchor ctagsRegexpOperator
	highlight link ctagsEreAlternate ctagsRegexpOperator
	highlight link ctagsEreGroup ctagsRegexpOperator
	highlight link ctagsEreBracketGroup ctagsRegexpOperator
	highlight link ctagsEreGroupStart ctagsRegexpOperator
	highlight link ctagsEreBadGroup ctagsErrorFallback
	highlight link ctagsEreLiteral ctagsExtendedRegexp
	highlight link ctagsEreQuantifiedLiteral ctagsRegexpCharClass
	highlight link ctagsErePlainQuantfier ctagsRegexpCharClass
	highlight link ctagsEreBracket ctagsRegexpOperator
	highlight link ctagsEreBracketCollation ctagsExtendedRegexp
	highlight link ctagsEreBracketEquivalence ctagsExtendedRegexp
	highlight link ctagsEreBracketClass ctagsRegexpCharClass
	highlight link ctagsEreBracketClassName ctagsRegexpClassName
	highlight link ctagsEreBracketClassNames ctagsRegexpClassNameEnum
	highlight link ctagsEreBracketLiteral ctagsExtendedRegexp
	highlight link ctagsEreBracketRange ctagsRegexpCharClass
	highlight link ctagsEreBracketRangeOp ctagsRegexpOperation
    else
	" monochrome highlighting for easier code browsing
	" errors will still show up in their normal color
	highlight link ctagsRegexpEscapes ctagsRegexpQuoted
	highlight link ctagsRegexpGnuCharClass ctagsRegexpQuoted
	highlight link ctagsRegexpGnuBackreference ctagsRegexpQuoted
	highlight link ctagsRegexpGnuAnchor ctagsRegexpQuoted
	highlight link ctagsEreQuotedChar ctagsRegexpQuoted
	highlight link ctagsEreBadEscape ctagsErrorFallback
	highlight link ctagsEreBadQuantifier ctagsErrorFallback
	highlight link ctagsEreBadQuantifierStart ctagsErrorFallback
	highlight link ctagsEreBadAnchor ctagsErrorFallback
	highlight link ctagsEreAnyChar ctagsRegexpQuoted
	highlight link ctagsEreAnchor ctagsRegexpQuoted
	highlight link ctagsEreAlternate ctagsRegexpQuoted
	highlight link ctagsEreGroup ctagsRegexpQuoted
	highlight link ctagsEreBracketGroup ctagsRegexpQuoted
	highlight link ctagsEreGroupStart ctagsRegexpQuoted
	highlight link ctagsEreBadGroup ctagsErrorFallback
	highlight link ctagsEreLiteral ctagsRegexpQuoted
	highlight link ctagsEreQuantifiedLiteral ctagsRegexpQuoted
	highlight link ctagsErePlainQuantfier ctagsRegexpQuoted
	highlight link ctagsEreBracket ctagsRegexpQuoted
	highlight link ctagsEreBracketCollation ctagsRegexpQuoted
	highlight link ctagsEreBracketEquivalence ctagsRegexpQuoted
	highlight link ctagsEreBracketClass ctagsRegexpQuoted
	highlight link ctagsEreBracketClassName ctagsRegexpQuoted
	highlight link ctagsEreBracketClassNames ctagsRegexpQuoted
	highlight link ctagsEreBracketLiteral ctagsRegexpQuoted
	highlight link ctagsEreBracketRange ctagsRegexpQuoted
	highlight link ctagsEreBracketRangeOp ctagsRegexpQuoted
    endif
endif

" Highlighting
"
highlight link ctagsComment Comment

highlight link ctagsStatement Statement
highlight link ctagsLanguageName Type
highlight link ctagsFlagName Keyword
highlight link ctagsFlagNameLetter Keyword
highlight link ctagsTableName Function
highlight link ctagsTagName Constant
highlight link ctagsExtraName Function
highlight link ctagsExtraLetter SpecialComment
highlight link ctagsRoleName Function
highlight link ctagsRoleLetter SpecialComment
highlight link ctagsParamName Function
highlight link ctagsFieldName Function
highlight link ctagsFieldLetter Special
highlight link ctagsKindName Identifier
highlight link ctagsKindLetter Special
highlight link ctagsKindLetterSpecial Question
highlight link ctagsDelimiter Operator
highlight link ctagsOperator Operator
highlight link ctagsOperation Question
highlight link ctagsDescription MoreMsg
highlight link ctagsString String
highlight link ctagsFlagValueString String
highlight link ctagsFlagValueNumber Number
highlight link ctagsFlagValueEnum Keyword
highlight link ctagsBasicRegexp StorageClass
highlight link ctagsExtendedRegexp String
highlight link ctagsPcreRegexp Conditional
highlight link ctagsRegexpQuoted SpecialChar
highlight link ctagsRegexpCharClass PreProc
highlight link ctagsRegexpClassName Function
highlight link ctagsRegexpClassNameEnum Keyword
highlight link ctagsRegexpOperator Normal
highlight link ctagsRegexpOperation ctagsOperation
highlight link ctagsGenericOptions Normal
highlight link ctagsSpecial Special
highlight link ctagsKeyword Keyword

let b:current_syntax='ctags'
