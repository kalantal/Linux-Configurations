# .bashrc

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

RCol='\[\e[0m\]'    # Text Reset
Red='\[\e[0;31m\]'  # Red
Gre='\[\e[0;32m\]'  # Green
Yel='\[\e[0;33m\]'  # Yellow
Blu='\[\e[0;34m\]'  # Blue
Pur='\[\e[0;35m\]'  # Purple
Cya='\[\e[0;36m\]'  # Cyan
Whi='\[\e[0;37m\]'  # White

LOCAL_IP=`/bin/hostname -I | sed 's/ //g'`

PS1="${Red}\u${Blu}@${Whi}$LOCAL_IP [\W]: \\$ "

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
