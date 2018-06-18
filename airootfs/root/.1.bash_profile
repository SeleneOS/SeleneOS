#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


## Custom ACharluk ##

export PATH=$PATH:~/.acharluk/scripts
export TERMINAL=xfce4-terminal
export BROWSER=chromium
export EDITOR=vim
export EDITOR2=code
export LOCATION=Granada

export conf_brc=~/.bashrc
export conf_bp=~/.bash_profile
export conf_vrc=~/.vimrc
export conf_i3c=~/.config/i3/config
export conf_i3b=~/.config/i3/i3blocks.config

if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep i3 || startx;
fi

## Your custom config ##
