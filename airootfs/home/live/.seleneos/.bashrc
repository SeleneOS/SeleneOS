#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'


## Custom Selene OS ##

if [ -f ~/.seleneos/.bash_aliases ]; then
. ~/.seleneos/.bash_aliases
fi

#region $PS1

# get current branch in git repo
function echo_git_and_exitstatus() {
    ret_val=$?
    output=""
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]; then
		STAT=`parse_git_dirty`
		output="${output}[${BRANCH}${STAT}] "
	fi

    if [ $ret_val -ne 0 ]; then
        output="${output}\e[35m<${ret_val}>\e[m "
    fi
    echo -e "$output"
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[34m\]\u\[\e[m\]@\h \[\e[33m\][\[\e[m\]\[\e[33m\]\w\[\e[m\]\[\e[33m\]]\[\e[m\] \[\e[36m\]\`echo_git_and_exitstatus\`\n\[\e[37m\]\\$\[\e[m\] "

#endregion

## Your custom config ##
