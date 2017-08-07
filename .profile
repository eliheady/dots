mesg n
umask 022

export PATH="/usr/local/bin:/usr/bin:/bin"

if [ -d "${HOME}/bin" ]; then
  export PATH="${HOME}/bin:${PATH}"
fi

export EDITOR=vi
export VISUAL=vi

# guard against malicious C1 char abuse
alias less='/usr/bin/less -nU'
alias tailf='/usr/bin/less -nUEX +F'

export LANG=en_US
export LANGUAGE=${LANG}


if [ "$BASH" ]; then
  if [ -f "${HOME}/.bashrc" ]; then
     source "${HOME}/.bashrc"
  fi
fi
