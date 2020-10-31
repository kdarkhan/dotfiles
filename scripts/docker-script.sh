set -ex

docker_file="$HOME/docker.json"

REGISTRY_HOST="myhost.com:5000"
docker_auth=$(cat docker.json | jq -r ".auths | .\"${REGISTRY_HOST}\".auth")

echo "Docker auth is ${docker_auth}"

REGISTRY_NAME="https://${REGISTRY_HOST}"

REPOSITORY=kdarkhan/alpine
TAG_OLD=latest
TAG_OLD=1.1
TAG_NEW=v1
CONTENT_TYPE="application/vnd.docker.distribution.manifest.v2+json"
# CONTENT_TYPE="application/vnd.docker.distribution.manifest.list.v2+json"

MANIFEST=$(curl -k -H "Accept: ${CONTENT_TYPE}" -H "Authorization: Basic ${docker_auth}" "${REGISTRY_NAME}/v2/${REPOSITORY}/manifests/${TAG_OLD}")

echo $MANIFEST | jq
# curl -X PUT -H "Content-Type: ${CONTENT_TYPE}" -d "${MANIFEST}" "${REGISTRY_NAME}/v2/${REPOSITORY}/manifests/${TAG_NEW}"

