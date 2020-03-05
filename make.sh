#!/bin/sh

# check for fonttosfnt
type fonttosfnt > /dev/null 2>&1 || {
    echo 'error : install fonttosfnt first' >&2
    exit 1
}

rm -rf   bin
mkdir -p bin

for src in src/*.bdf; do
    bin=${src##*/}
    bin=bin/${bin%.bdf}.otb

    fonttosfnt -o "$bin" "$src"
done
