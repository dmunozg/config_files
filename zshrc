# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Autocompletion
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
    compinit -i
else
    compinit -C -i
fi

zmodload -i zsh/complist

# History file
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

# Autocorrection
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

# Fix keys
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# Antibody plugins

source <(antibody init)

antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle ohmyzsh/ohmyzsh path:plugins/tmux

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
antibody bundle zsh-users/zsh-history-substring-search

antibody bundle romkatv/powerlevel10k

export EDITOR=emacs

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

# Pretty ls
alias ls="/usr/bin/lsd"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Cargo and pip
PATH=$PATH:$HOME/.cargo/bin:$HOME/.local/bin

# Command not found
source /usr/share/doc/pkgfile/command-not-found.zsh

# Kitty over ssh
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

export TERMINAL=kitty
