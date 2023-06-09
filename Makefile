include help.mk

guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "argument '$*' is required"; \
		exit 1; \
	fi

.PHONY: install
install: ##@initilization Install dependencies to use k3d.
	@bash lib/install

.PHONY: bootstrap
bootstrap: ##@cluster Bootstrap cluster with everything
	@bash lib/bootstrap

.PHONY: cleanup
cleanup: ##@cluster Delete cluster
	@bash lib/cleanup
