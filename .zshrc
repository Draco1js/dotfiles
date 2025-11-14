# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ "$(uname)" == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# <!========== Set directory for zinit and it's plugins ==========!>
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# <!========== Download zinit if it's not there ==========!>
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# <!========== Source zinit ==========!>
source "${ZINIT_HOME}/zinit.zsh"

# <!========== Plugins, powerlevel10k, syntax highlighting, completionns etc. ==========!>
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZP::command-not-found
zinit snippet OMZP::sudo

# <!========== Load Completions ==========!>
fpath=(/Users/aayan/.docker/completions $fpath)
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# <!========== Keybinds ==========!>
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# <!========== History Config ==========!>
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# <!========== Case insensitive autocompletion and colors =========!>
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" 
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# <!========== Aliases and Shell Integrations ==========!>
alias ls='ls --color'
alias vim='nvim' # I keep accidentally using vim instead of nvim

# Fzf for completions instead of the default
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


# <!========== Path Stuff ==========!>
export PATH="/opt/homebrew/Cellar/john-jumbo/1.9.0_1/share/john/:$PATH"

#Inserted by PNPM Cli
export PNPM_HOME="~/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# Inserted by PNPM Cli


# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:/usr/games"
