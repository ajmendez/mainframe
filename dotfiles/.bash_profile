#!/bin/bash
# ~/.bashrc: executed by bash(1) for non-login shells.
# [2010-05-31] : Mendez


# New Terminal:
#   Runs .bash_profile
# New Bash:
#   Runs .bashrc
# New XTerm:
#   Runs .bashrc

[ -z "$PS1" ] && return

export DOTFILES=$HOME/etc/mainframe/

source $DOTFILES/.bash_aliases
source $DOTFILES/.bashrc