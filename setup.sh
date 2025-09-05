#!/bin/zsh

link_dotfiles() {
    SRC="$HOME/Desktop/Developer/dotfiles"
    TGT="$HOME"

    for file in $SRC/*(D); do
        name=$(basename $file)

        t=$TGT/$name
        regex='^(README\.md|\.git|setup\.sh)$'

        if [[ $name =~ $regex ]] || [ -h $t ]; then
            continue
        fi

        echo -n $name

        if [ -f $t ] || [ -d $t ]; then
            echo " [error] file exists or is directory"
        else
            ln -s "$file" "$t"
            if [ $? -ne 0 ]; then
                echo " [error] failed unexpectedly"
            else
                echo " successfully symlinked"
            fi
        fi
    done
}
