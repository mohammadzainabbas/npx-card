#!/bin/sh

if [ -z "$1" ]; then
  echo "Error: No architecture specified" && exit 1
fi

if [ -z "$2" ]; then
  echo "Error: No node version specified" && exit 1
fi

node_version="$(node --version)"
architecture="$(node -e 'console.log(process.arch)')"

echo "Verifying node version '$node_version' on '$architecture' architecture"

if [ -z "$(echo $architecture | grep --fixed-strings $1)" ]; then
  echo "Error: Unexpected architecture" && exit 1
fi

if [ -z "$(echo $node_version | grep --fixed-strings v$1)" ]; then
  echo "Error: Unexpected Node version" && exit 1
fi
