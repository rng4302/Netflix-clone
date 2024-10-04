# Builds a Docker image.

set -u # or set -o nounset
: "$VERSION"
: "$CONTAINER_REGISTRY"

docker build -t $CONTAINER_REGISTRY/netflixclone:$VERSION --file ./Dockerfile .