# grpc-modules
Contains protbuf definitions for servers, their generated code and related utilities

## Structure

- proto
  - contains protobuf file modules (named by service exposing the api)
  - `google` and `protoc-gen-openapiv2` are dependencies we use in our protobuf files (dont touch)
- pkg
  - contains generated go code per module
  - `utils` package contains sub-packages with generic code used by services using grpc
  - :warning: everything below package except `utils` will be deleted when running `make generate`
- docs
  - contains swagger API files per module
  - regenerated each time `make generate` is run

## How to use

1. Add new module as folder under `./proto`
1. Run `make generate`

## Generated Files

From the `.proto` file we generate:
- stubs for implementing all defined services and their methods
- a REST API gateway to also serve conventional HTTP/1.1 requests (using `google.api.annotations`)
- a swagger file to match the REST gateway (using `protoc-gen-openapiv2`)
- client code to use the server

The [REST gateway](https://github.com/grpc-ecosystem/grpc-gateway) is intended as a fallback and for local testing (with the example `.http` file).
In production we should use grpc for communication wherever possible.

To use grpc in a browser we require a proxy because of [problems with browsers and HTTP/2](https://grpc.io/blog/state-of-grpc-web/).
We use the wrapper [grpcweb](https://github.com/improbable-eng/grpc-web/tree/master/go/grpcweb) that serves as this proxy to allow communiation between `grpc-web` and this service.

That all leads to this service exposing three endpoints on two ports:
- [9199] HTTP/2 gRPC endpoint
- [9188] HTTP/1.1 endpoint
    - grpc content type from grpc-web handled by `grpcweb` wrapper
    - json content type handled by REST API Gateway

The requests to all endpoints are routed to and handled by the same implementation.
