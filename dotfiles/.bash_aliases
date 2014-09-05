#!/bin/bash
# ~/.bash_aliases: Alias definitions.
# [2010-06-01] Mendez

#------------------------------------------------------------------------------#
# enable color support of ls and also add handy aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
if [ "$TERM" != "dumb" ]; then
    if [ -x /usr/bin/dircolors ]; then
        eval "`dircolors -b`"
    fi
fi



#------------------------------------------------------------------------------#
# Basic Unix Niceities
alias env-update='source ~/.bash_profile'
alias nano='nano -w'
alias xgterm='xgterm -sb'
alias xterm='xterm -fg white -bg black'
alias enscript='enscript -r -H -f "Times-Roman8"'

#------------------------------------------------------------------------------#
# I hate all of this typing:
alias af='alias | egrep'
alias sf='env | egrep'
ff() { find . -name $* -print; }
alias big='ls -ohS'
alias new='ls -oht'
alias p='python'
alias ip='ipython'
# if [[ $HOSTMAE == "offshore.ucsd.edu" ]]; then
#   alias emacs='~/tmp/emacs/emacs-23.2/src/emacs'
#   alias emacsclient='~/tmp/emacs/emacs-23.2/lib-src/emacsclient'
# fi
# if [[ $HOSTNAME == "electron.blue.shell.la" ]]; then
#     # alias mate2='osascript ~/Documents/Mate.scpt'
#     # alias m='mate'
#     # alias m='open -ga TextMate'
#     alias o='open'
#     alias projectlog='open -ga TextMate ~/Dropbox/ProgressLog2.task'
#     alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
#     alias emacsclient='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'
#     # alias em='emacs -nw'
#     # alias m='emacs'
# fi
# alias e='emacsclient -n -a emacs'
# alias em='e -nw'
# alias m='mate'
# alias edl='emacsclient -nw -a idl --eval "(idlwave-shell ''quick)"'
# alias netstat_osx="sudo lsof -i -P"


emacsro() {
#  echo "${*:2}"
  echo $@
  emacs $@ --eval '(setq buffer-read-only t)'
}


#alias e='emacs -nw'
alias e='emacsclient -n -a emacs'
alias edl='emacsclient -nw -a idl --eval "(idlwave-shell ''quick)"'
alias svndiff='svn diff --diff-cmd 'colordiff' -x "-y --width=$COLUMNS"'
alias gw='gv --watch'



# duf :: sort nicely with human readable
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'