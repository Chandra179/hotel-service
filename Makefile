# Run the Spring Boot application
.PHONY: run
run:
	./gradlew bootRun

# Clean the project
.PHONY: clean
clean:
	./gradlew clean

# Build the project
.PHONY: build
build:
	./gradlew build

# Run tests
.PHONY: test
test:
	./gradlew test

# Rebuild Docker images without cache
.PHONY: docker/rebuild
docker/rebuild:
	docker-compose -f docker-compose.yml build --no-cache --parallel
	docker-compose -f docker-compose.yml up -d

# Start Docker containers
.PHONY: docker/up
docker/up:
	docker-compose -f docker-compose.yml up -d

# Stop Docker containers
.PHONY: docker/down
docker/down:
	docker-compose -f docker-compose.yml down