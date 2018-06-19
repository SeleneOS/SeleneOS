# Spells
alias lumos="ls -lahF"
alias accio="grep --color=auto"
alias avadakedabra="kill -9"

# Basic shortcuts
alias s='sudo'
alias sv='sudo vim'
alias c='clear'
alias l='ls -F'
alias ll='ls -lFh'
alias lh='ls -aF'
alias llh='lumos'
alias la='lh | accio'
alias lla='llh | accio'
alias wt='weather'
alias n='newsboat'
alias z='zathura'
alias m='mpv'
alias d='diary'
alias mf='mpv --fullscreen'
alias ms='mpv --no-video'
alias yd='youtube-dl'
alias ydv='yd -o ~/videos/%%\(title\)s-%%\(id\)s.%%\(ext\)s'
alias yv='youtube-viewer'

# Useful directories
alias ..='cd ..'
alias .,-='cd -'
alias .h='cd ~'
alias .t='cd ~/testing'
alias .w='cd ~/downloads'
alias .r='cd ~/repos'
alias .d='cd ~/documents'
alias .m='cd ~/music'
alias .p='cd ~/pictures'
alias .v='cd ~/videos'
alias .s='cd ~/.seleneos/scripts'
alias .a='cd ~/.seleneos'
alias .c='cd ~/.config'

alias l..='l ..'
alias l.h='l ~'
alias l.t='l ~/testing'
alias l.w='l ~/downloads'
alias l.r='l ~/repos'
alias l.d='l ~/documents'
alias l.m='l ~/music'
alias l.p='l ~/pictures'
alias l.v='l ~/videos'

alias ll..='ll ..'
alias ll.h='ll ~'
alias ll.t='ll ~/testing'
alias ll.w='ll ~/downloads'
alias ll.r='ll ~/repos'
alias ll.d='ll ~/documents'
alias ll.m='ll ~/music'
alias ll.p='ll ~/pictures'
alias ll.v='ll ~/videos'

# Shortcut for editing config files in vim
alias v='$EDITOR'
alias vbrc='$EDITOR $conf_brc'
alias vbp='$EDITOR $conf_bp'
alias vvrc='$EDITOR $conf_vrc'
alias vi3c='$EDITOR $conf_i3c'
alias vi3b='$EDITOR $conf_i3b'

# Shortcut for editing config files in vscode
alias vv='$EDITOR2'
alias vvbrc='$EDITOR2 $conf_brc'
alias vvbp='$EDITOR2 $conf_bp'
alias vvvrc='$EDITOR2 $conf_vrc'
alias vvi3c='$EDITOR2 $conf_i3c'
alias vvi3b='$EDITOR2 $conf_i3b'

# Shortcuts for git
alias g='git'
alias gl='git pull'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gp='git push'
gcp() { git add . && git commit -m "$1" && git push; }

# Easy TODO list
todo() {
	if [ $# -gt 0 ]; then
		echo "[] $@" >> ~/.seleneos/TODO;
	else
		$EDITOR ~/.seleneos/TODO;
	fi
}
alias ttodo='$EDITOR2 ~/.seleneos/TODO'
alias t='todo'
alias tt='ttodo'

fw() { while inotifywait "$1"; do "$2"; done }
fwl() { while inotifywait "$1"; do pdflatex $1; done }
fwm() { while inotifywait "$1"; do make; done }
fwmr() { while inotifywait "$1"; do make run; done }


## TODO: Use Yay instead of Yaourt ##
# Shortcuts for pacman/yaourt
# alias y='yaourt --noconfirm'
# alias yi='yaourt -S --noconfirm'
# alias yr='sudo pacman -Rs'
# alias yu='sudo pacman -Su'
# alias yyu='yaourt -Syu --aur --noconfirm'
# alias yrd='s pacman -Rs $(pacman -Qtdq)'
