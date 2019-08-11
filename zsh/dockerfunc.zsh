# Clean All Images And Containers
# Read: https://gist.github.com/abranhe/d9b80ee91747067ea0aa2016b9b6ed20
alias docker-clean=docker_clean

docker_clean() {
	docker rm $(docker ps -a -q)
	docker rmi $(docker images -q)
}

del_stopped(){
	local name=$1
	local state
	state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

	if [[ "$state" == "false" ]]; then
		docker rm "$name"
	fi
}

firefox(){
	del_stopped firefox

    docker run -d \
		--name firefox \
		-e DISPLAY=$IP:0 \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		jess/firefox

	# exit current shell
	exit 0
}