build-docker:
	docker build -t loho .

run-docker:
	docker run -it --rm \
		--gpus all \
		--network host \
		--volume /dev/shm:/dev/shm \
		--volume $(shell pwd):/home \
		--volume $(shell pwd)/../_gen:/_gen \
		--workdir /home \
		--name loho \
		--hostname loho \
		loho /bin/bash
