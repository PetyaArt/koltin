#!/bin/bash

MERGED_ON_REMOTE=$(git branch --merged master)

if [ "$MERGED_ON_REMOTE" ]; then
	echo "The following remote branches are fully merged and will be removed:"
	echo "$MERGED_ON_REMOTE"

	read -p "Continue (y/N)? "
	if [ "$REPLY" == "y" ]; then
		git branch -r --merged origin/master | sed 's/ *origin\///' \
			| grep -v 'master$' | xargs -I% git push origin :% 2>&1 \
			| grep --colour=never 'deleted'
		echo "Done!"
	fi
fi