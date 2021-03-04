SHELL := /bin/bash

# $1 = package name
define print_pkg_version_stmt
import pkg_resources; \
print(pkg_resources.get_distribution("$1").version)
endef

# $1 = package name
define pkg_version
	$(shell docker run -it --rm \
		otkds/grpclib \
		python -c '$(call print_pkg_version_stmt,$1)')
endef

.PHONY: build
build:
	docker build --no-cache -t otkds/grpclib .
	$(eval VERSION := $(call pkg_version,grpclib))
	$(eval PROTOBUF_VERSION := $(call pkg_version,protobuf))
	$(eval GRPCIO_VERSION := $(call pkg_version,grpcio-tools))
	$(eval MYPY_VERSION := $(call pkg_version,mypy-protobuf))
	$(eval FULL_VERSION := $(VERSION)-protobuf$(PROTOBUF_VERSION)-grpcio$(GRPCIO_VERSION)-mypy$(MYPY_VERSION))
	docker tag otkds/grpclib otkds/grpclib:$(VERSION)
	docker tag otkds/grpclib otkds/grpclib:$(FULL_VERSION)
	@echo
	@echo $$'\e[01;32m--- To push images run: ---\e[0m'
	@echo "docker push otkds/grpclib"
	@echo "docker push otkds/grpclib:$(VERSION)"
	@echo "docker push otkds/grpclib:$(FULL_VERSION)"
	@echo $$'\e[01;32m---------------------------\e[0m'
	@echo
