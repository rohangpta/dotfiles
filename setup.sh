#!/bin/zsh

link_dotfiles() {
    SRC="$HOME/Desktop/Developer/dotfiles"
    TGT="$HOME"

    for file in $SRC/*(D); do
        name=$(basename $file)
        t=$TGT/$name
        echo -n $name
        regex=^("README.md"|".git")$

        if [[ $name =~ $regex ]]; then
            echo " skipping"
            continue
        elif [ -h $t ]; then
            echo " [warning] already symlinked"
        elif [ -f $t ] || [ -d $t ]; then
            echo " [error] file exists or is directory"
        else
            ln -s $file $t
            if [ $? -ne 0 ]; then
                echo " [error] failed unexpectedly"
            else
                echo " successfully symlinked"
            fi
        fi
    done
}
