#!/usr/bin/env bash

cd tool
lsc parse-yaml
lsc build
cd ..
find web/src/pug -type f | grep "\.pug" | xargs touch
