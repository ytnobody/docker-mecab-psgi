IMAGE_NAME = "mecab-psgi"
PORT ?= 5000

.PHONY: build run


build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run --rm -p $(PORT):$(PORT) -it $(IMAGE_NAME) 