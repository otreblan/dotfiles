#!/bin/bash

# A script to replay terminal recordings


# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

LEVEL=0
NEXTLEVEL=""
DATE=""
SEPARATOR="-"

until [[ $((LEVEL++)) -eq 4 ]]
do
	# Selecting the next level.
	# It filters out the calling script, puts some the date in long format,
	# and finally it only selects the last number.
	NEXTLEVEL=$( \
		ls | grep -v *.sh |\
		sed "s/\(.*\)/${DATE}\1/g" |\
		rofi -dmenu |\
		sed "s/.*[^0-9]\+\([0-9]\+\)/\1/g")

	# Changing to hour separator
	if (( LEVEL > 3 ))
	then
		SEPARATOR=":"
	fi

	# Going to the next level
	DATE+=${NEXTLEVEL}${SEPARATOR}
	cd ${NEXTLEVEL}
done

# Selecting the replay to be played.
# It filters the file extension and deletes the duplicates,
# also it puts and filters the date in long format..
REPLAY=$(\
	ls | sed "s/\(.*\)\..*/\1/g" |\
	sed "s/\(.*\)/${DATE}\1/g" |\
	uniq | rofi -dmenu |\
	sed "s/.*[^0-9]\+\([0-9]\+\)/\1/g")

# Play
scriptreplay -t ${REPLAY}.txt -s ${REPLAY}.log
