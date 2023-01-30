#!/bin/sh

set -e 

cd iris-messenger && NODE_OPTIONS=--openssl-legacy-provider yarn serve
