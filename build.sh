#!/bin/bash

SRC_DIR=src
BUILD_DIR=build
CONTENT_DIR=pages

rm -rf ${BUILD_DIR}

for f in $(find $CONTENT_DIR -name "*.md") ; do
  target=${f#pages}
	mkdir -p ${BUILD_DIR}/`dirname $target`;
	pandoc --template src/template.html5 "$f" -o "${BUILD_DIR}/${target%.md}.html";
done
npx prettier --write ${BUILD_DIR}/** ${BUILD_DIR}/**/*
cp $SRC_DIR/*.css ${BUILD_DIR}

