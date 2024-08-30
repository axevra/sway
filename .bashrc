#!/usr/bin/env bash

eval "$(starship init bash)"
alias ls="lsd -a"
alias clock='clock-rs'
alias cp='cp -i'
alias mv='mv -i'
alias tra='trash -v'
alias mkdir='mkdir -p'
alias ping='ping -c 10'
alias c='clear'
alias distro='cat /etc/lsb-release | grep DESCRIPT | sed -e "s|.*=||" | sed -e "s|\"||g"'
alias dani="jerry --dub --rofi -i -d -c"
alias ani="jerry --rofi -i -d -c"
cd ()

{
if [ -n "$1" ]; then
builtin cd "$@" && lsd -a
else
builtin cd ~ && lsd -a
fi
}


extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf "$archive" ;;
			*.tar.gz) tar xvzf "$archive" ;;
			*.bz2) bunzip2 "$archive" ;;
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

export PATH="$HOME/.cargo/bin:$PATH"


alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '

fastfetch
