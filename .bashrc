# .bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoredups
HISTSIZE=10000
HISTFILESIZE=100000

shopt -s histappend
shopt -s checkwinsize

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Google Cloud Shell?
# Tests may not always work. As of now: (20170520)
#   env vars "DEVSHELL*" exist
#   uname contains 'devshell'
if [ ! -z "${!DEVSHELL*}" -o \
     ! -z "$(uname -n | sed '/devshell/p;d')" ]; then
    if [ -f ${HOME}/.bashrc.google ]; then
        source ${HOME}/.bashrc.google
    elif [ -f /google/devshell/bashrc.google ]; then
        source /google/devshell/bashrc.google
    fi
fi

if [ -d "${HOME}/utils" ]; then

    # AWS
    if [ -d "${HOME}/utils/aws" ]; then
      export PATH="${HOME}/utils/aws/bin:${PATH}"
    fi

    # Go
    if [ -d "${HOME}/utils/go/bin" ]; then
      export PATH="${PATH}:${HOME}/utils/go/bin"
    fi

    # Google Cloud SDK
    if [ -d "${HOME}/utils/google-cloud-sdk" ]; then
      if [ -f "${HOME}/utils/google-cloud-sdk/path.bash.inc" ]; then
        source "${HOME}/utils/google-cloud-sdk/path.bash.inc"
      fi
      if [ -f "${HOME}/utils/google-cloud-sdk/completion.bash.inc" ]; then
        source "${HOME}/utils/google-cloud-sdk/completion.bash.inc"
      fi
    fi

fi

# local Go path
if [ -d "${HOME}/gopath" ]; then
    export GOPATH="${HOME}/gopath"
    export PATH="${PATH}:${GOPATH}"
fi
