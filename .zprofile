eval "$(/opt/homebrew/bin/brew shellenv)"

alias currsem="cd $HOME/Desktop/F22"
alias dev="cd $HOME/Desktop/Developer/"
alias k="kubectl"
alias e="emacs"
alias grep="rg"
alias cat="bat"

PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH"
PATH="/Applications/Emacs.app/Contents/MacOS:$PATH"
PATH="/Users/rohangupta/.emacs.d/bin:$PATH"
PATH="/Library/TeX/texbin:$PATH"

export PATH
bindkey -v
