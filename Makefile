jaeger-ui.tar.gz:
	docker build . -t jaeger-ui
	docker create --name jaeger-ui jaeger-ui
	docker cp jaeger-ui:/jaeger-ui.tar.gz ./
	docker rm jaeger-ui

build/index.html: jaeger-ui.tar.gz
	cd build && tar -xvzf ../jaeger-ui.tar.gz

.PHONY: all
all: build/index.html

.PHONY: clean
clean:
	rm build/* -r
	rm jaeger-ui.tar.gz
