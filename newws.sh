#!/bin/bash
commands=`compgen -c | tail -n+26`
options=" \n  \n "
echo "$commands" |echo -e $options |sort | uniq | rofi -show -dmenu -theme /usr/share/rofi/themes/arthur.rasi -font "Hack 20" | while read cmd; do
#echo "$commands\n$zsh_aliases" | sort | uniq | dmenu -l 20 -p 'new ws' | while read cmd; do
#    /home/patrick/i3-create-empty-workspace.py && i3-msg workspace $cmd
i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1)):$cmd
done

