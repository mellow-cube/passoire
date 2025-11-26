DOCKER = sudo docker

IMAGE_TARGET = passoire-group18-modified:1

DUMP_DIR = dump

CONTAINER_ID = $(error Please set CONTAINER_ID)
USERNAME=$(error Please set USERNAME)

build:
	# Build the docker image using the file automatically
	$(DOCKER) build -t $(IMAGE_TARGET) .

$(DUMP_DIR):
	mkdir -p $(DUMP_DIR)
	# Copy files
	$(DOCKER) cp $(CONTAINER_ID):/passoire/ $(DUMP_DIR)
	# Change ownership
	sudo chown $(USER) -R $(DUMP_DIR)/passoire/ 
	# Add inspection log
	$(DOCKER) inspect $(IMAGE_TARGET) > $(DUMP_DIR)/image-inspect.json

clean: $(DUMP_DIR)
	rm -r $(DUMP_DIR)

.PHONY: build clean

