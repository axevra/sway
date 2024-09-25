#!/usr/bin/env bash

eval "$(fzf --bash)"
eval "$(starship init bash)"
set -o vi

#alias 
alias ls="eza -a"
alias l="eza --color always --icons --hyperlink --group-directories-first --tree --level=1"
alias ll="eza --color always --icons --hyperlink --group-directories-first --tree --level=1 --long --header --inode --links"
alias clock='clock-rs'
alias cp='cp -i'
alias mv='mv -i'
alias tra='trash -v'
alias mkdir='mkdir -p'
alias ping='ping -c 10'
alias c='clear'
alias distro='cat /etc/lsb-release | grep DESCRIPT | sed -e "s|.*=||" | sed -e "s|\"||g"'
alias v="lvim"
alias titus="curl -fsSL https://christitus.com/linux | sh"
alias rebuild="nixos-rebuild switch --use-remote-sudo --flake ~/.config/mid_os"
alias cat="bat --style=plain --pager=never"
alias rebuild-dry="nixos-rebuild dry-build --use-remote-sudo --flake ~/.config/mid_os";
alias rebuild-test="nixos-rebuild test --use-remote-sudo --flake ~/.config/mid_os";

##############################################################################################
#fonctions
cd ()
{
if [ -n "$1" ]; then
builtin cd "$@" && eza -a
else
builtin cd ~ && eza -a
fi
}


extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf "$archive" ;;
			*.tar.gz) tar xvzf "$archive" ;;
			*.bz2) bunzip2 "$archive" ;;
      *.tar.xz) tar xf "$archive" ;; 
			*.rar) rar x "$archive" ;;
			*.gz) gunzip "$archive" ;;
			*.tar) tar xvf "$archive" ;;
			*.tbz2) tar xvjf "$archive" ;;
			*.tgz) tar xvzf "$archive" ;;
			*.zip) unzip "$archive" ;;
			*.Z) uncompress "$archive" ;;
			*.7z) 7z x "$archive" ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

cpp() {
    set -e
    strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
    awk '{
        count += $NF
        if (count % 10 == 0) {
            percent = count / total_size * 100
            printf "%3d%% [", percent
            for (i=0;i<=percent;i++)
                printf "="
            printf ">"
            for (i=percent;i<100;i++)
                printf " "
            printf "]\r"
        }
    }
    END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}

######################################################################
#export 
export PATH="$HOME/.cargo/bin:$PATH"
export MANPAGER='lvim +Man!'
export PAGER='lvim +Man!'
export EDITOR="lvim"
