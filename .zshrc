export DOTFILES=$HOME/.dotfiles

HISTFILE=~/.histfile
HISTSIZE=20000
SAVEHIST=20000

setopt appendhistory extendedhistory extendedglob
bindkey -v

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/functions.zsh
source $DOTFILES/zsh/prompt.zsh

export PATH=$HOME/bin:$PATH
export EDITOR=vim

# source /usr/local/opt/zsh-history-substring-search/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

zstyle :compinstall filename "$HOME/.zshrc"

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
	autoload -Uz compinit
	compinit
fi


zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name 

#Change ls colours
# LS_COLORS="ow=01;36;40" && export LS_COLORS

#make cd use the ls colours
# zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"



# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export THEME="base16-default"

# There is an alias called urxvt-light that passes BACKGROUND=light variable so we want to leverage that
[ -n "$BACKGROUND" ] || export BACKGROUND="dark"
# export THEME="base16-solarized"
# export BACKGROUND="light"

BASE16_SHELL="$HOME/.base16_theme"
source $BASE16_SHELL

autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
