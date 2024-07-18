release:
    mkdir -p ./release
    for GOOS in linux darwin; do \
        for GOARCH in amd64 arm64; do \
            rm -rf ./build; mkdir -p ./build; \
            GOOS=${GOOS} GOARCH=${GOARCH} go build -ldflags "-s -w -X main.Version=`git rev-parse HEAD`" -o ./build/goofys; \
            cp README{,-azure,-gcs}.md LICENSE ./build/; \
            pushd build; \
            tar czf ../release/goofys-${GOOS}-${GOARCH}.tar.gz goofys README{,-azure,-gcs}.md LICENSE; \
            popd; \
        done; \
    done
