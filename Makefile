DOCKER = sudo docker

IMAGE_TARGET = passoire-group18-modified:1

DUMP_DIR = dump

CONTAINER_ID = $(error Please set CONTAINER_ID) # Currently unused, might be reused in future
CONTAINER_NAME = passoire_modified_running

ifndef USERNAME
$(error USERNAME is not set)
endif

build:
	# Build the docker image using the file automatically
	$(DOCKER) build -t $(IMAGE_TARGET) .

$(DUMP_DIR):
	mkdir -p $(DUMP_DIR)
	# Copy files
	$(DOCKER) cp $(CONTAINER_NAME):/passoire/ $(DUMP_DIR)
	# Change ownership
	sudo chown $(USERNAME) -R $(DUMP_DIR)/passoire/ 
	# Add inspection log
	$(DOCKER) inspect $(IMAGE_TARGET) > $(DUMP_DIR)/image-inspect.json

clean: $(DUMP_DIR)
	rm -r $(DUMP_DIR)

run:
	$(DOCKER) run -d --name $(CONTAINER_NAME) $(IMAGE_TARGET)

stop:
	$(DOCKER) stop $(CONTAINER_NAME)

.PHONY: build clean run stop
