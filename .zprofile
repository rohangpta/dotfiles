eval "$(/opt/homebrew/bin/brew shellenv)"

alias currsem="cd $HOME/Desktop/S23"
alias dev="cd $HOME/Desktop/Developer/"
alias dl="cd $HOME/Downloads"
alias k="kubectl"
alias tf="terraform"
alias e="emacs --daemon"
alias grep="rg"
alias cat="bat"
export AWS_PROFILE=pennlabs-tf

export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"

bindkey '^r' _atuin_search_widget

PATH="/Users/rohangupta/Downloads/traefik-migration-tool_v0.13.5_darwin_arm64:$PATH"

PATH="/Applications/Emacs.app/Contents/MacOS:$PATH"
PATH="/Users/rohangupta/.emacs.d/bin:$PATH"
PATH="/Library/TeX/texbin:$PATH"

# Collect Kubernetes contexts
export KUBECONFIG="$HOME/.kube/config"
KUBE_CONTEXTS="$HOME/.kube/contexts"
mkdir -p "${KUBE_CONTEXTS}"
for contextFile in `find "${KUBE_CONTEXTS}" -type f`  
do
    export KUBECONFIG="$contextFile:$KUBECONFIG"
done

export PATH
bindkey -v

export PATH="$PATH:/Users/rohangupta/Library/Application Support/Coursier/bin"
alias gs='git status'
alias gd='git diff HEAD'
alias c='clear'
alias t='tmux -a -t 0'
alias ca="$HOME/.local/bin/cursor-agent"

m() {
  python3 -c "from math import *; print($*)"
}
alias llmfuse='cd /Users/rohangupta/Desktop/Developer/llmfuse'
