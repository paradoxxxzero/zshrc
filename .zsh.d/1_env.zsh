#!/bin/zsh

###################
# 1 environnement #
###################

export PATH=/usr/share/perl5/site_perl/auto/share/dist/Cope:$PATH:/usr/bin/vendor_perl:/usr/bin/site_perl:$HOME/.gem/ruby/2.0.0/bin

export EDITOR="emacsclient -c"
export BROWSER=chromium
export GPGKEY=1193ADBC
export WORDCHARS="_-"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export WORKON_HOME=~/.envs
export PROJECT_HOME=~/kozea
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export GIT_MERGE_AUTOEDIT=no

# Host specific configuration
case $HOST in
    archw)
        export MPD_HOST=entrecote
    ;;
esac
export PYTHONSTARTUP="$ZDOTDIR/.pythonrc.py"
if [ -x "$HOME/.stderrred.so" ]; then
    export LD_PRELOAD="$HOME/.stderrred.so"
fi

export PYTHONPATH=$PYTHONPATH:/home/zero/_/_
export HYDRA_FOLDER=/home/zero/kozea/hydra/hydra/
export HYDRA_TEST_DB_NAME=hydraempty_testing
export STDERRED_ESC_CODE=`echo -e "\e[1;38;5;204m"`
