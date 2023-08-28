.PHONY: generate
generate: docker-build-code
	-find ./pkg -not -path "*/utils/*" -delete
	-rm -rf ./docs
	$(eval CID := $(shell docker create "grpc-modules:code-gen"))
	-docker cp $(CID):/app/pkg/. ./pkg/
	-docker cp $(CID):/app/docs/. ./docs/
	docker rm $(CID)

.PHONY: docker-build-code
docker-build-code:
	docker buildx build \
		--cache-to type=gha,mode=max \
		--cache-from type=gha \
		--build-arg GITHUB_USER_TOKEN \
		--target code-gen \
		-t "grpc-modules:code-gen" \
		-f Dockerfile \
		--load \
		.
