# Personal aliases and functions.

# Personal environment variables and startup programs should go in
# ~/.bash_profile.  System wide environment variables and startup
# programs are in /etc/profile.  System wide aliases and functions are
# in /etc/bashrc.

if [ -f "/etc/bashrc" ] ; then
  source /etc/bashrc
fi
if [ $EUID -eq 0 ] ; then
        alias nu='setup-grat-os -cu'
        alias del='cards remove'
        alias get='cards install'
        alias up='cards install -u'
        alias sysup='cards upgrade'
        alias check='cards sync;cards diff'
else
        alias nu='sudo setup-grat-os -cu'
        alias del='sudo cards remove'
        alias get='sudo cards install'
        alias up='sudo cards install -u'
        alias sysup='sudo cards upgrade'
        alias check='sudo cards sync;sudo cards diff'
fi
alias search='cards search'
alias ll='ls -l'
alias l='ls -alh'
alias duh='du -h --max-depth=1'
alias dfh='df -h'
alias pkgfind='cards list | grep -i'

# End ~/.bashrc