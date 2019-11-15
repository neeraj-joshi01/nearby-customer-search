#!/bin/sh
set -e

if [ "$1" = 'test' ]; then
  echo "Executing tests"
  rspec 
else
  exec "$@"
fi