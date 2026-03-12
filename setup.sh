#!/bin/zsh

SRC="$HOME/Desktop/Developer/dotfiles"

link_dotfiles() {
    TGT="$HOME"
    skip='^(README\.md|\.git|\.gitignore|setup\.sh|\.config|\.hammerspoon)$'

    for file in $SRC/*(D); do
        name=$(basename $file)

        if [[ $name =~ $skip ]] || [ -h "$TGT/$name" ]; then
            continue
        fi

        echo -n "$name"

        if [ -f "$TGT/$name" ] || [ -d "$TGT/$name" ]; then
            echo " [error] file exists or is directory"
        else
            ln -s "$file" "$TGT/$name"
            if [ $? -ne 0 ]; then
                echo " [error] failed unexpectedly"
            else
                echo " successfully symlinked"
            fi
        fi
    done
}

link_config_dirs() {
    # Symlink .config subdirectories (nvim, atuin, karabiner, etc.)
    for dir in $SRC/.config/*/; do
        name=$(basename "$dir")
        tgt="$HOME/.config/$name"

        echo -n ".config/$name"

        if [ -h "$tgt" ]; then
            echo " [skip] already symlinked"
            continue
        fi

        mkdir -p "$HOME/.config"

        if [ -d "$tgt" ]; then
            echo " [error] directory exists — back it up first"
        else
            ln -s "$dir" "$tgt"
            echo " successfully symlinked"
        fi
    done
}

link_hammerspoon() {
    tgt="$HOME/.hammerspoon"
    echo -n ".hammerspoon"

    if [ -h "$tgt" ]; then
        echo " [skip] already symlinked"
    elif [ -d "$tgt" ]; then
        echo " [error] directory exists — back it up first"
    else
        ln -s "$SRC/.hammerspoon" "$tgt"
        echo " successfully symlinked"
    fi
}

link_ghostty() {
    # Ghostty uses ~/Library/Application Support path on macOS
    tgt="$HOME/Library/Application Support/com.mitchellh.ghostty"
    src="$SRC/.config/ghostty/config"
    echo -n "ghostty config"

    if [ ! -f "$src" ]; then
        echo " [skip] no config in dotfiles"
        return
    fi

    mkdir -p "$tgt"

    if [ -h "$tgt/config" ]; then
        echo " [skip] already symlinked"
    elif [ -f "$tgt/config" ]; then
        echo " [error] config exists — back it up first"
    else
        ln -s "$src" "$tgt/config"
        echo " successfully symlinked"
    fi
}

create_secrets() {
    if [ ! -f "$HOME/.secrets" ]; then
        echo "# API Keys — add your keys here" > "$HOME/.secrets"
        echo "# export GEMINI_API_KEY=" >> "$HOME/.secrets"
        echo "# export ANTHROPIC_API_KEY=" >> "$HOME/.secrets"
        chmod 600 "$HOME/.secrets"
        echo ".secrets created — add your API keys to ~/.secrets"
    else
        echo ".secrets already exists"
    fi
}

echo "=== Dotfiles Setup ==="
echo ""
echo "--- Top-level dotfiles ---"
link_dotfiles
echo ""
echo "--- .config directories ---"
link_config_dirs
echo ""
echo "--- Hammerspoon ---"
link_hammerspoon
echo ""
echo "--- Ghostty ---"
link_ghostty
echo ""
echo "--- Secrets ---"
create_secrets
echo ""
echo "=== Done ==="
