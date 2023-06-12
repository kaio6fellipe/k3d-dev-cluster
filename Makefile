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
	make base-helm
	make apps-manifests
	make apps-helm

.PHONY: cleanup
cleanup: ##@cluster Delete cluster
	@bash lib/cleanup

.PHONY: apps-manifests
apps-manifests: ##@apps-config Apply the manifests on bootstrap/apps/manifests folder
	@bash lib/apps-manifests

.PHONY: apps-helm
apps-helm: ##@apps-config Apply the manifests on bootstrap/apps/helm folder
	@bash lib/apps-helm

.PHONY: base-manifests
base-manifests: ##@base-config Apply the manifests on bootstrap/base folder
	@bash lib/base-manifests

.PHONY: base-helm
base-helm: ##@base-config Apply the manifests on bootstrap/helm folder
	@bash lib/base-helm