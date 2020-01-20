#!/bin/sh

# ensure bdftopcf is installed
if ! type fonttosfnt > /dev/null; then
    echo 'error : install fonttosfnt first' >&2
    exit 1
fi

for font in *.bdf; do
    fonttosfnt -v -m 2 -o "${font%.*}.otb" "$font"
done
