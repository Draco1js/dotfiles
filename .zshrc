export PATH="/opt/homebrew/Cellar/john-jumbo/1.9.0_1/share/john/:$PATH"


# pnpm
export PNPM_HOME="/Users/aayan/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


source ~/.zsh/completions/pnpm-completions.zsh
source ~/.zsh/completions/node-completions.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(zoxide init --cmd cd zsh)"
