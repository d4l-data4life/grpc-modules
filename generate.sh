#!/bin/bash

create_out_folder () {
    mkdir -p ../pkg/$1 ../docs/$1
}

call_protoc () {
    protoc \
        --plugin=protoc-gen-go=/go/bin/protoc-gen-go \
        --go_out ../pkg/ \
        --go_opt paths=source_relative \
        --plugin=protoc-gen-go-grpc=/go/bin/protoc-gen-go-grpc \
        --go-grpc_out ../pkg/ \
        --go-grpc_opt paths=source_relative \
        --plugin=protoc-gen-grpc-gateway=/go/bin/protoc-gen-grpc-gateway \
        --grpc-gateway_out ../pkg/ \
        --grpc-gateway_opt logtostderr=true \
        --grpc-gateway_opt paths=source_relative \
        --openapiv2_out ../docs/ \
        --openapiv2_opt logtostderr=true \
        $1
}

convert_docs () {
    yq eval -oy ../docs/$1.swagger.json > ../docs/$1.swagger.yaml
    rm ../docs/$1.swagger.json
}

cd ./proto
for file in $(find . -type f -not -path "./google*" -not -path "./protoc-*" ); do
    no_ext=${file%%.proto}
    echo "=====${no_ext}====="
    create_out_folder ${file%/*}
    call_protoc $file
    convert_docs $no_ext
    echo "... done"
done
