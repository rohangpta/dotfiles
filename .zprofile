eval "$(/opt/homebrew/bin/brew shellenv)"

alias currsem="cd Desktop/S22"
alias dev="cd Desktop/Developer/"
alias k="kubectl"
alias e="emacs"
alias grep="rg"
alias cat="bat"

PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
PATH="/Applications/Emacs.app/Contents/MacOS:$PATH"
PATH="/Users/rohangupta/.emacs.d/bin:$PATH"

export PATH
bindkey -v
