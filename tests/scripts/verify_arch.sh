#!/bin/sh

if [ -z "$1" ]; then
  echo "Error: No OS specified" && exit 1
fi

if [ -z "$2" ]; then
  echo "Error: No architecture specified" && exit 1
fi

if [ -z "$3" ]; then
  echo "Error: No node version specified" && exit 1
fi

os="$(node -e 'console.log(process.platform)')"
node_version="$(node --version)"
architecture="$(node -e 'console.log(process.arch)')"

echo "Verifying node version '$node_version' with '$architecture' architecture on '$os'"

if [ -z "$(echo $architecture | grep --fixed-strings $2)" ]; then
  echo "Error: Unexpected architecture" && exit 1
fi

if [ -z "$(echo $node_version | grep --fixed-strings $3)" ]; then
  echo "Error: Unexpected Node version" && exit 1
fi
