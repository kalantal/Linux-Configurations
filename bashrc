# .bashrc

#eval `ssh-agent -s`
#ssh-add

RCol='\[\e[0m\]'    # Text Reset
Red='\[\e[0;31m\]'  # Red
Gre='\[\e[0;32m\]'  # Green
Yel='\[\e[0;33m\]'  # Yellow
Blu='\[\e[0;34m\]'  # Blue
Pur='\[\e[0;35m\]'  # Purple
Cya='\[\e[0;36m\]'  # Cyan
Whi='\[\e[0;37m\]'  # White

#Kali-IP-fix
#LOCAL_IP=`/bin/hostname -I | sed 's/ //g'`
LOCAL_IP=`/bin/hostname --ip-address`

#Kali-like
#PS1="${Red}\u@$LOCAL_IP${Whi}:${Blu}/\W${RCol}\\$"
#RHEL
#PS1="\[\033]0;${USER}@\h\007\]${Red}\u${Blu}@${Whi}$LOCAL_IP[\W]:\\$ "

case $TERM in
    xterm*)
        PS1="\[\033]0;${USER}@\h\007\]${Red}\u${Blu}@${Whi}$LOCAL_IP[\W]:\\$ "
        ;;
    *)
        PS1="${Red}\u${Blu}@${Whi}$LOCAL_IP[\W]:\\$ "
        ;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
