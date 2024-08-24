#!/bin/bash

# Remove generated files
rm -r ./serviceapi/*

# Generate the files
openapi-generator-cli generate -i ./api-spec/api.yaml -g go-server -o ./serviceapi --additional-properties=packageName=pelvapi

# Rename the directory
mv ./serviceapi/go ./serviceapi/pelvapi

# Remove main.go and Dockerfile
rm -f ./serviceapi/main.go
rm -f ./serviceapi/Dockerfile

# Change directory to the output directory
cd ./serviceapi

go get github.com/gorilla/mux

# Update go.mod with the desired module name
go mod edit -module=serviceapi

go mod tidy

echo "Files generated in ./serviceapi/pelvapi"
