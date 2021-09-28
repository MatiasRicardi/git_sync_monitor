#!/bin/bash

root_path="/home/apps/"
apps=("app1" "app2" "app3")


while true 
do 
	echo "running.."
	for i in "${apps[@]}"
	do
		path_app="$root_path$i"
		cd $path_app
		echo $path_app
		git fetch
		branch=$(git rev-parse --abbrev-ref HEAD)
		local_commit=$(git log | head -1)
		echo $local_commit
		origin_commit=$(git log origin/$branch | head -1)
		echo $origin_commit
		if [[ $local_commit != $origin_commit ]]; then
						#command to update you app
            git pull					
		else
				echo "already udpated"
		fi
	done
  
	echo "sleeping..."
	#wait 1 minute before run again
        sleep 60s

done 

