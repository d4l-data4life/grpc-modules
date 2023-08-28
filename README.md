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
