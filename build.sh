#!/usr/bin/env bash

cd tool
lsc parse-yaml
lsc build
lsc thumb
cd ..
find web/src/pug -type f | grep "\.pug" | xargs touch
