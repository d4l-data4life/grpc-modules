# syntax = docker/dockerfile:experimental

ARG GO_VERSION=1.27

##############################
### Code Generation
##############################

FROM golang:${GO_VERSION}-alpine AS code-gen

RUN apk add --no-cache nodejs npm protobuf-dev bash
RUN npm i -g ts-proto@2.12.1

WORKDIR /app

# Install code generation tools
RUN --mount=type=cache,target=/go/pkg/mod \
    go install \
        github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@v2.33.0 \
        github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@v2.33.0

RUN --mount=type=cache,target=/go/pkg/mod \
    go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.36.12

RUN --mount=type=cache,target=/go/pkg/mod \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.6.2

RUN --mount=type=cache,target=/go/pkg/mod \
    go install github.com/mikefarah/yq/v4@v4.54.1

COPY ./proto ./proto
COPY generate.sh .
RUN ./generate.sh
