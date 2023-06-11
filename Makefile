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
bootstrap: cleanup ##@cluster Bootstrap cluster with everything
	@bash lib/bootstrap
	make base-manifests
	make helm-manifests
	make apps-manifests

.PHONY: cleanup
cleanup: ##@cluster Delete cluster
	@bash lib/cleanup

.PHONY: apps-manifests
apps-manifests: ##@base-config Apply the manifests on bootstrap/apps folder
	@bash lib/apps-manifests

.PHONY: base-manifests
base-manifests: ##@base-config Apply the manifests on bootstrap/base folder
	@bash lib/base-manifests

.PHONY: helm-manifests
helm-manifests: ##@base-config Apply the manifests on bootstrap/helm folder
	@bash lib/helm-manifests