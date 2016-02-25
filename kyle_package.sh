#!/usr/local/bin/bash
nagiosim_pkgs=( "php" "mysesql-server" "php-mysql" "sendmail" "unzip" "zip" "php-mcrypt" )
base_pkgs=( "vim-lite" "zsh" "sudo" "git" "tmux" "curl" "rsync" "tree" "byobu" "wget" )

declare -a missing_pkgs=()

for p in "${nagiosim_pkgs[@]}"; do
	$(pkg info -e "$p")
	if [ $? -ne 0 ]; then
		missing_pkgs+=("$p")
		echo $p added to install list
	else
		echo $p is present
	fi
done

echo "${missing_pkgs[@]}"
