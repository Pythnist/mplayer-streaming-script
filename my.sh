#!/usr/bin/env bash
if [ "$UID" == "0" ]
then
echo "NOTE: This script is not meant to be run as root"
fi
link=$1
let x=0
if [ "$link" != "" ]
then
if [ "$(echo "$link"|cut -d"=" -f1 -)" != "http://www.youtube.com/watch?v" ]
then
echo -e "\nSimple YouTube to mPlayer streaming Script"
if [ "$link" != "--help" ]
then
echo "ERROR: No such available option: $1!"
let x=1
fi
echo -e "Usage: $0 [OPTION]\n\nSince this script is made by a really dumb person, you can only specify one option at time.\nAvailable options are:\n\n\t<YouTube link>\t Plays the supplied YouTube link\n\t--help\t\t Displays this help\n\nBy default, if no option is specified, The script will ask you for a YouTube link.\n"
exit $x
fi
fi
TMPDIR="/tmp/YouTube-to-mPlayer"
while [ "$link" == "" ]
do
echo "Paste your YouTube link below!"
read link
if [ "$(echo "$link"|cut -d"=" -f1 -)" != "https://www.youtube.com/watch?v" ]
then
if [ "$link" == "" ]
then
let x=1
exit $x
fi
echo "\"$link\" Is not a YouTube Link"
link=""
fi
done
link=$(echo "$link"|cut -d"&" -f1 -)
let x=0
mkdir "$TMPDIR"
mplayer -cookies -cookies-file "$TMPDIR/cookie.txt" $(youtube-dl -gf 34 --cookies "$TMPDIR/cookie.txt" "$link")
rm -rf "$TMPDIR"
exit $x
