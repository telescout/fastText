#!/usr/bin/env bash

echo "## Installing Emscripten"
rm -rf emsdk
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
./emsdk install 2.0.32
./emsdk activate 2.0.32
source ./emsdk_env.sh

echo "## Building webassembly"
cd ..
make clean
make wasm

echo "## Copy artifacts to dist"

rm -rf dist
mkdir dist
cp webassembly/fasttext_wasm.js ./dist
cp webassembly/fasttext_wasm.wasm ./dist

echo "## Done"
