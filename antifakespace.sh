#!/bin/bash
file="$1"
sed -i 's/\xC2\xA0/ /g;s/\r//' "$file"
