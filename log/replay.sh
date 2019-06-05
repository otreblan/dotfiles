#!/bin/bash

# A script to replay terminal recordings

LEVEL=0
NEXTLEVEL=""
DATE=""
SEPARATOR="-"

until [[ $((LEVEL++)) -eq 4 ]]
do
	# Selecting the next level.
	# It filters out the calling script,
	# puts some the date in long format,
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
# It filters the file extension
# and deletes the duplicates,
# also it puts the date in long format
# and finally it´s filtered out.
REPLAY=$(\
	ls | sed "s/\(.*\)\..*/\1/g" |\
	sed "s/\(.*\)/${DATE}\1/g" |\
	uniq | rofi -dmenu |\
	sed "s/.*[^0-9]\+\([0-9]\+\)/\1/g")

# Play
scriptreplay -t ${REPLAY}.txt -s ${REPLAY}.log
