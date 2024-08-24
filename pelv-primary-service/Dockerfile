FROM pelv-rhel-go-base-image as base_mage

FROM base_mage as build

# Set the working directory
WORKDIR /src

# Copy the Go module files and the rest of the application code
COPY . .
RUN go mod download

ENV CGO_ENABLED=0

RUN ./build/generate.sh

RUN go build -o primary-service .

FROM base_mage AS runtime

COPY --from=build /build/src/pelv-primary-service/release ./app

EXPOSE 8080/tcp

# Set the working directory
WORKDIR /app

ENTRYPOINT ["./primary-service"]




