eval "$(/opt/homebrew/bin/brew shellenv)"

alias currsem="cd $HOME/Desktop/S23"
alias dev="cd $HOME/Desktop/Developer/"
alias dl="cd $HOME/Downloads"
alias k="kubectl"
alias e="emacs --daemon"
alias grep="rg"
alias cat="bat"
export AWS_PROFILE=pennlabs-tf

export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"

bindkey '^r' _atuin_search_widget

PATH="/Users/rohangupta/Downloads/traefik-migration-tool_v0.13.5_darwin_arm64:$PATH"
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
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

# >>> coursier install directory >>>
export PATH="$PATH:/Users/rohangupta/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

vterm_prompt_end() {
    if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
        vterm_printf "51;A$(whoami)@$(hostname):$(pwd)";
    fi
}
setopt PROMPT_SUBST
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
