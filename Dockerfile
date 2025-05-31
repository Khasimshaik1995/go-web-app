# base image
FROM golang:1.22.5 as builder

# set working directory
WORKDIR /app

# install dependencies
COPY go.mod ./
RUN go mod download

# copy source code
COPY . .

# build binary
RUN go build -o main .


# final stage
FROM scratch

# set working directory
WORKDIR /app

# copy binary
COPY --from=builder /app/main .
COPY --from=builder /app/static ./static
EXPOSE 8080
CMD ["./main"]