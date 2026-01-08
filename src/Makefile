APP_NAME = TRRSPO
SRC_FILE = TRRSPO.go
BIN_DIR = ../usr/local/bin

all: build

build:
	@echo "Компиляция программы..."
	@mkdir -p $(BIN_DIR)
	@go mod tidy
	@go build -o $(BIN_DIR)/$(APP_NAME) $(SRC_FILE)
	@echo "Компиляция завершена!"

clean:
	@echo "Очистка..."
	@rm -f $(BIN_DIR)/$(APP_NAME)

