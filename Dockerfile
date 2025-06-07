# base stage
FROM golang:1.22.7 AS base

# install dependencies
COPY go.mod ./
RUN go mod download

# set working directory
WORKDIR /app


# dev stage
FROM base AS dev

# for live reload
RUN go install -mod=mod github.com/githubnemo/CompileDaemon

# copy source code
COPY . .

# expose the port
EXPOSE 8080

# run the app
ENTRYPOINT [ "CompileDaemon", "--build=go build -o main .", "--command=./main", "-polling=true" ]

# build stage
FROM base AS builder

# copy source code
COPY . .

# build binary
RUN CGO_ENABLED=0 GOOS=linux go build -o main .


# final stage
FROM scratch AS prod

# set working directory
WORKDIR /app

# copy binary
COPY --from=builder /app/main .

# copy static
COPY --from=builder /app/static ./static

# expose the port
EXPOSE 8080

# run the app
ENTRYPOINT [ "./main" ]
