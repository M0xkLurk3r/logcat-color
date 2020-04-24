#! /bin/bash
#
# Author: Anthony Lee (https://github.com/M0xkLurk3r)
# Licensed: GPLv2 (for full version of license, see /LICENSE)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

while read LINE; do
	if [ "${LINE:0:3}" != "---" ]; then
		IFS=' '
		read -ra LINEARG <<< "${LINE}"
		echo -en "\033[0;35m"${LINEARG[0]}" "${LINEARG[1]}" "
		echo -en "\033[0;32m"${LINEARG[2]}" \033[2;32m"${LINEARG[3]}" "
		least_color="\033[0m"
		if [ "${LINEARG[4]}" == "E" ] || [ "${LINEARG[4]}" == "F" ]; then
			least_color="\033[1;31m"
		elif [ "${LINEARG[4]}" == "W" ]; then
			least_color="\033[0;33m"
		elif [ "${LINEARG[4]}" == "D" ]; then
			least_color="\033[4;37m"
		elif [ "${LINEARG[4]}" == "A" ]; then
			least_color="\033[0;32m"
		fi
		echo -en $least_color${LINEARG[4]}" "${LINEARG[5]}"\t"
		IFS=':'
		read -ra LINEARG <<< "${LINE}"
		arglen="${#LINEARG[@]}"
		for (( i=3; i<$arglen; i++ )) do
			if [ $i -ne 3 ]; then
				echo -n ':'
			fi
			echo -en ${LINEARG[$i]}
		done
	else
		echo -en "\033[7;37"${LINE}
	fi
	echo -e "\033[0m"
done
