#!/usr/bin/env bash


echo "1Current dir  $(pwd)"

cd /home/runner/work/fastText/fastText

echo "2Current dir  $(pwd)"

echo "## Installing Emscripten"
rm -rf emsdk
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk
echo "3Current dir  $(pwd)"
./emsdk install 2.0.32
./emsdk activate 2.0.32
source ./emsdk_env.sh

echo "## Building webassembly"
cd ..
echo "4Current dir  $(pwd)"
make clean
make wasm

echo "## Copy artifacts to dist"

rm -rf dist
mkdir dist
cp webassembly/fasttext_wasm.js ./dist
cp webassembly/fasttext_wasm.wasm ./dist

echo "## Done"
