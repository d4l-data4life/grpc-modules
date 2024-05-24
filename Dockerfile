# syntax = docker/dockerfile:experimental

ARG GO_VERSION=1.22

########################
### Code Generation
########################

FROM ${IMG_BASE}golang:${GO_VERSION} AS code-gen

RUN apt update && apt install -y protobuf-compiler

WORKDIR /app

# Install code generation tools
RUN --mount=type=cache,target=/go/pkg/mod \
    go install \
        github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest \
        github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest

RUN --mount=type=cache,target=/go/pkg/mod \
    go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

RUN --mount=type=cache,target=/go/pkg/mod \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

RUN --mount=type=cache,target=/go/pkg/mod \
    go install github.com/mikefarah/yq/v4@latest

COPY ./proto ./proto
COPY generate.sh .
RUN ./generate.sh
