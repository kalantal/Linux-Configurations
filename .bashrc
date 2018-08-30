# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export M2_HOME=/usr/bin/apache-maven-3.0.5
export M2=$M2_HOME/bin
export PATH=$M2:$PATH

RCol='\[\e[0m\]'    # Text Reset
Red='\[\e[0;31m\]'  # Red
Gre='\[\e[0;32m\]'  # Green
Yel='\[\e[0;33m\]'  # Yellow
Blu='\[\e[0;34m\]'  # Blue
Pur='\[\e[0;35m\]'  # Purple
Cya='\[\e[0;36m\]'  # Cyan
Whi='\[\e[0;37m\]'  # White

LOCAL_IP=`/bin/hostname -I | sed 's/ //g'`

#Kali
#PS1="${Red}\u@$LOCAL_IP${Whi}:${Blu}/\W${RCol}\\$"
#RHEL
PS1="\[\033]0;${USER}@\h\007\]${Red}\u${Blu}@${Whi}$LOCAL_IP[\W]:\\$ "

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
