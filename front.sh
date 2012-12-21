    #!/usr/bin/env bash
    while :
    do
    let x=0
    link=$(zenity --entry --text "Insert YouTube link:" --title="Link Input")
    if [ "$(echo "$link"|cut -d"=" -f1 -)" != "http://www.youtube.com/watch?v" ]
    then
    if [ "$link" == "" ]
    then
    let x=1
    exit $x
    fi
    zenity --error --text "\"$link\" Is not a YouTube Link"
    link="--gui"
    else
    break
    fi
    done

    if [ -f ./my.sh ]
    then
    ./my.sh "$link"
    fi
    exit $x
