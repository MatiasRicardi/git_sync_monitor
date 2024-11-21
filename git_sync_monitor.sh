#!/bin/bash

#apps path
root_path="/home/apps/"

#apps (folders) to update
#full path will be created using $root_path + apps[i]
apps=("app1" "app2" "app3")


while true 
do 
	echo "$(date '+%Y-%m-%d %H:%M:%S') - running script.."
	for i in "${apps[@]}"
	do
		path_app="$root_path$i"
		cd $path_app

		echo "$(date '+%Y-%m-%d %H:%M:%S') - checking app $path_app"	
		git fetch
		
		branch=$(git rev-parse --abbrev-ref HEAD)
		
		#getting local commit hash
		local_commit=$(git rev-parse HEAD)
		echo "$(date '+%Y-%m-%d %H:%M:%S') - local hash $local_commit"
		
		#getting origin commit hash
		origin_commit=$(git rev-parse "origin/$branch")
		echo "$(date '+%Y-%m-%d %H:%M:%S') - origin hash $origin_commit"
		
		#comparing local commit hash with origin commit hash
		if [[ $local_commit != $origin_commit ]]; then
			echo "$(date '+%Y-%m-%d %H:%M:%S') - updating app $path_app"
			#command to update you app here
 			git pull					
		else
			echo "$(date '+%Y-%m-%d %H:%M:%S') - app $path_app is up to date"
		fi
	done
  
	echo "$(date '+%Y-%m-%d %H:%M:%S') - sleeping..."
	#wait 1 minute before run again
  	sleep 60s

done 
