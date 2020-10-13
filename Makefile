BUILD_DIR=build

.PHONY: build run clean

build: clean
	mkdir -p ${BUILD_DIR}
	for f in *.md ; do \
		pandoc --template template.html5 "$$f" -o "${BUILD_DIR}/$${f%.md}.html"; \
	done
	npx prettier --write ${BUILD_DIR}/*
	cp *.css ${BUILD_DIR}

clean:
	rm -rf ${BUILD_DIR}

run: build
	cd ${BUILD_DIR} && python3 -m http.server

