# Makefile

# --- Variables ---
BIN_NAME = bookmarks-keeper
CMD_PATH = ./cmd/$(BIN_NAME)

# Arguments passed to the executable via the command line
ARGS ?=

INSTALL_DIR = $(shell go env GOBIN)
# Default to $GOPATH/bin if GOBIN isn't explicitly set
ifeq ($(INSTALL_DIR),)
    INSTALL_DIR = $(shell go env GOPATH)/bin
endif

# --- Tools ---
GOOSE := go tool -modfile=go.tool.mod goose
SQLC := go tool -modfile=go.tool.mod sqlc

DB_PATH = ./db/local.sqlite3
SQLC_CONFIG = ./db/sqlc.yaml

# --- Targets ---

.PHONY: all build test install run clean migrate-up migrate-down sqlc-generate

# Default target: runs build, then test, then the application
all: build test run

# Build target: compiles the executable
build:
	@echo "Building $(BIN_NAME)..."
	go build -o $(BIN_NAME) $(CMD_PATH)
	@echo "Build successful: ./${BIN_NAME}"

# Install target: compiles the executable and moves it to GOBIN
install: clean build
	@echo "Installing $(BIN_NAME) to $(INSTALL_DIR)..."
	mkdir -p $(INSTALL_DIR)
	mv $(BIN_NAME) $(INSTALL_DIR)
	@echo "$(BIN_NAME) installed. Run it with: $(BIN_NAME)"

# Test target: runs all unit tests
test:
	@echo "Running tests..."
	go test ./...

# Run target: executes the built binary
# It uses the ARGS variable to pass command line arguments.
run:
	@echo "Running executable with arguments: $(ARGS)"
	./$(BIN_NAME) $(ARGS)

# Clean target: removes the locally built executable
clean:
	@echo "Cleaning up..."
	rm -f $(BIN_NAME)

# Run pending migrations to update the database schema.
migrate-up:
	@echo "Running database migrations UP..."
	$(GOOSE) -env=.env.local up

# Reverts the last set of migrations.
migrate-down:
	@echo "Rolling back database migrations DOWN..."
	$(GOOSE) -env=.env.local down

# This generates Go code from SQL queries.
sqlc-generate:
	@echo "Generating Go code from SQL queries..."
	$(SQLC) generate -f $(SQLC_CONFIG)
