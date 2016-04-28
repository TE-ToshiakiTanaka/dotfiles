# --------------------------
# General Settings
##--------------------------
export EDITOR=vim
export LANG=ja_JP.UTF-8
export KCODE=u
export AUTOFEATURE=true

setopt noflowcontrol
bindkey -v
bindkey '\e[Z' reverse-menu-complete
bindkey '^F' forward-word
bindkey '^B' backward-word
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward
bindkey '^J' run-help
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

setopt nobeep
setopt auto_cd
setopt auto_pushd
setopt correct
setopt magic_equal_subst
setopt prompt_subst
setopt notify
setopt equals

### Complement ###
autoload -U compinit; compinit
set auto_list
set auto_menu
set list_packed
set list_types
#bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### Glob ###
setopt extended_glob
unsetopt caseglob

### History ###
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt bang_hist
setopt extended_history
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

function history-all { history -E 1 }


limit coredumpsize 102400
unsetopt promptcr
setopt long_list_jobs
setopt list_types
setopt auto_resume
setopt pushd_ignore_dups
setopt hist_verify
setopt numeric_glob_sort
setopt print_eight_bit
setopt auto_param_keys
setopt interactive_comments
setopt hist_no_store
setopt list_packed
setopt noautoremoveslash

# ------------------------------
# # Look And Feel Settings
# # ------------------------------
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

autoload -Uz add-zsh-hook
autoload -Uz colors; colors
colors
autoload -Uz vcs_info

zstyle ':vsc_info:*' enable git svn hg bzr
zstyle ':vsc_info:*' formats '(%s) - [%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

autoload -Uz is-at-least
if is-at-least 4.3.10; then
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"
    zstyle ':vcs_info:git:*' unstagedstr "-"
    zstyle ':vcs_info:git:*' formats '(%s)[%b] %c%u'
    zstyle ':vcs_info:git:*' actionformats '(%s)[%b|%a] %c%u'
fi
function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg

tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%1(v|%F{magenta}%1v%f|) %{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

if [ ${UID} -eq 0 ]; then
   tmp_prompt="%B%U${tmp_prompt}%u%b"
   tmp_prompt2="%B%U${tmp_prompt2}%u%b"
   tmp_rprompt="%B%U${tmp_rprompt}%u%b"
   tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt
PROMPT2=$tmp_prompt2
RPROMPT=$tmp_rprompt
SPROMPT=$tmp_sprompt

[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[yellow]}%}${HOST%%.*} - ${PROMPT}"
;

case "${TERM}" in
kterm* | xterm* )
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}\007"
    }
    ;;
esac


# Alias
if type dircolors > /dev/null
then
    alias _ls-color='command ls --color=auto'
else
    alias _ls-color='command ls -G'
fi
alias ls='_ls-color -F'
alias la='ls -a'
alias ll='ls -lAh'
alias sudo='sudo -E'
alias cp='cp -pi'
alias mv='mv -i'
alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto'
alias diff='diff -U 0'

## load user .zshrc configuration file
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
