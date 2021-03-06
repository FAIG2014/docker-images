#!/bin/bash
set -e
set -u

# cleans all containers
CONTAINERS=$(docker ps -qa)
count=$(echo "${CONTAINERS}" | wc -l)
if [[ ${count} < 1 ]]; then
    echo "No docker containers left to clean"
else
    echo "Cleaning up ${count} containers:"
    echo "${CONTAINERS}"
    echo "${CONTAINERS}" | xargs docker rm &>/dev/null &
fi

# cleans dangling images
IMAGES=$(docker images -q --filter "dangling=true")
count=$(echo "${IMAGES}" | wc -l)
if [[ ${count} < 1 ]]; then
    echo "No docker images left to clean"
else
    echo "Cleaning up ${count} images:"
    echo "${IMAGES}"
    echo "${IMAGES}" | xargs docker rmi &>/dev/null &
fi

