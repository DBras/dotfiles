#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# #### Auto-run ssh-agent on bash start
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
# 	    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
# 	    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi

#### Some aliases for convenience.
alias maple='/opt/maple2021/bin/xmaple'
alias dotconfig='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias fehr='feh -g 1280x720+1280 -.'
alias scrotclip='scrot -s ~/foo.png \
	&& xclip -sel clip -t image/png ~/foo.png \
	&& rm ~/foo.png'
# alias ls='ls --color=auto'
# alias l='ls -lavh --ignore=..'   # show long listing of all except ".."
# alias ll='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
# alias la='ls -A'
alias ls='exa'
alias l='exa --long --icons'   # show long listing of all except ".."
alias ll='exa --long --all --icons'   # show long listing but no hidden dotfiles except "."
alias lt='exa --long --tree --level=3'
alias altcode="$HOME/.local/bin/altcode-master/altcode -o clipboard -s rofi"
alias sshot="scrot --select ~/Pictures/scrot/temporary.png && xclip -se c -t image/png -i ~/Pictures/scrot/temporary.png && rm ~/Pictures/scrot/temporary.png"
alias cnvim="nvim ~/.config/nvim/init.vim"
alias cqtile="nvim ~/.config/qtile/config.py"
alias ckeys="nvim ~/.config/qtile/keys.py"
alias cbash="nvim ~/.bashrc"
alias initnote="mkdir notes && cd notes && mkdir img && nvim"
alias skcon="sudo wg-quick up wg0"
alias skdis="sudo wg-quick down wg0"
alias venv="source venv/bin/activate"
alias beginlatex="mkdir img && mkdir tex && cp ~/Dropbox/DTU/latex/preamble.tex . && cp ~/Dropbox/DTU/latex/img/DTU.eps img/DTU.eps && echo -e \"%! TEX root = main.tex\n\n\" > main.tex && nvim main.tex"
alias startssh='eval "$(ssh-agent -s)"'
alias refile='nvim ~/Documents/gollum-wiki/wikimd/refile.md'

alias cat='bat'
alias man='batman'

alias 34338="cd ~/Dropbox/DTU/E22/34338"
alias 34210="cd ~/Dropbox/DTU/F23/34210"
alias 34359="cd ~/Dropbox/DTU/F23/34359"
alias 34229="cd ~/Dropbox/DTU/F23/34229"
alias 10020="cd ~/Dropbox/DTU/F23/10020"
alias E21="cd ~/Dropbox/DTU/E21"
alias E22="cd ~/Dropbox/DTU/E22"
alias E23="cd ~/Dropbox/DTU/E23"
alias F22="cd ~/Dropbox/DTU/F22"
alias F23="cd ~/Dropbox/DTU/F23"
alias ml="cd ~/Dropbox/DTU/F23/ML"
alias wiki='cd ~/Documents/gollum-wiki/wikimd'
alias homelab='cd ~/Documents/homelab'

export PATH="/home/daniel/.local/bin:$PATH" # Add .local/bin to PATH
colorscript random # Print random colorscript on start
eval "$(zoxide init bash)"
eval "$(starship init bash)" # Start starship prompt

export QSYS_ROOTDIR="/home/daniel/intelFPGA_lite/21.1/quartus/sopc_builder/bin"
export EDITOR="nvim"
