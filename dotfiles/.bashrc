#!/bin/bash
# bashrc
# 2014 Mendez


if [ "$TERM" != "dumb" ]; then
    if [ -x /usr/bin/dircolors ]; then
        eval "`dircolors -b`"
    fi
    alias ls='ls --color=auto'
    alias grepc='grep -n --color=auto'
fi


