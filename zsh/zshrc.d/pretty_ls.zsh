#!/bin/sh

alias ls="/usr/bin/lsd"
alias grep="grep --color=always"

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
export PYGMENTIZE_STYLE='material'
