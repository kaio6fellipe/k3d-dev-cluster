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
	make apps-manifests
	make list-cluster-info

.PHONY: cleanup
cleanup: ##@cluster Delete cluster
	@bash lib/cleanup

.PHONY: apps-manifests
apps-manifests: ##@cluster Apply the manifests on bootstrap/apps/manifests folder
	@bash lib/apps-manifests

.PHONY: base-manifests
base-manifests: ##@cluster Apply the manifests on bootstrap/base/manifests folder
	@bash lib/base-manifests

.PHONY: list-cluster-info
list-cluster-info: ##@cluster List base ingress domain information
	@bash lib/list-cluster-info

.PHONY: nettools
nettools: ##@operation Enter in the busybox pod
	@kubectl delete pod nettools
	@sleep 5
	@kubectl apply -f ./bootstrap/apps/nettools/pod.yaml
	@sleep 10
	@kubectl exec -it nettools -- bash