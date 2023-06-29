export GO111MODULE=on
GO_SRC=$(shell find . -path ./.build -prune -false -o -name \*.go)

.PHONY: all
all: lint test

test: $(GO_SRC) example_tests fdedup_tests

example_tests: $(GO_SRC)
	go test -v -race -cover -coverpkg ./... -coverprofile=example_coverage.txt -covermode=atomic ./...

lint: ./.golangcilint.yaml
	./bin/golangci-lint --version || curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b ./bin v1.53.3
	./bin/golangci-lint --config ./.golangcilint.yaml run ./...

.PHONY: fdedup_tests
fdedup_tests: $(GO_SRC)
	cd ./tests && go test -v -race -cover -coverpkg "gojini.dev/fdedup" -coverprofile=../coverage.txt -covermode=atomic ./...