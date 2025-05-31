# base stage
FROM golang:1.22.5 AS base

# install dependencies
COPY go.mod ./
RUN go mod download

# set working directory
WORKDIR /app


# dev stage
FROM base AS dev

# for live reload
RUN go install github.com/cosmtrek/air@v1.40.4

# copy source code
COPY . .

# expose the port
EXPOSE 8080

# run the app
ENTRYPOINT [ "air" ]


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
COPY --from=builder /app/static ./static

# expose the port
EXPOSE 8080

# run the app
ENTRYPOINT [ "./main" ]
