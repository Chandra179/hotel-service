# Run the Spring Boot application
.PHONY: run
run:
	docker compose up -d
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

# Stop Docker containers
.PHONY: docker/down
docker/down:
	docker-compose -f docker-compose.yml down