# Start from the latest golang base image
FROM golang:1.21-alpine3.18 AS builder

# Add Maintainer Info
LABEL maintainer="Krishna Tej CH <chkrishnatej11@gmail.com>"

# Set the Current Working Directory inside the builder container
WORKDIR /app

# Copy the source from the current directory to the Working Directory inside the builder container
COPY main.go .

# Build the Go app as a static binary
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o server main.go

# Start a new stage from scratch
FROM scratch

# Copy the binary from builder stage
COPY --from=builder /app/server /server

EXPOSE 8081

# Command to run the executable
CMD ["/server"]
