FROM pelv-rhel-go-base-image AS base_mage

FROM base_mage as build

# Set the working directory
WORKDIR /src/pelv-primary-service

# Copy the Go module files and the rest of the application code
COPY . .
RUN go mod download

ENV CGO_ENABLED=0

RUN ./build/generate.sh

RUN cd ./serviceapi

RUN go mod tidy

RUN cd ../

RUN go build -o ./bin/primary-service .

FROM base_mage AS runtime

COPY --from=build /src/pelv-primary-service/bin ./app

EXPOSE 8080/tcp

# Set the working directory
WORKDIR /app

ENTRYPOINT ["./primary-service"]




