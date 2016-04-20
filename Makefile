.DEFAULT_GOAL := build

TAG=neochrome/move:latest

build:
	@docker build -t $(TAG) .

debug:
	@docker run --rm -it --name move-debug -v $$PWD/entrypoint.sh:/entrypoint.sh --volumes-from move-debug-data $(TAG) /src /dst

debug-data:
	@docker run --rm -it --name move-debug-data -v /src -v /dst --entrypoint /bin/sh $(TAG)

clean:
	@docker rmi -f $(TAG)
