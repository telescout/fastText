#!/usr/bin/env bash
set -e

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
# cp webassembly/fasttext_wasm.js ./dist
# cp webassembly/fasttext_wasm.wasm ./dist
cd ./dist
tar cjf fasttext_wasm.tar.bz2 -C ../webassembly  fasttext_wasm.js fasttext_wasm.wasm

echo "## Done"
