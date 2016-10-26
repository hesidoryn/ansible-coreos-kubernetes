#!/bin/bash

function start_addons {
    until curl --silent "http://127.0.0.1:8080/version"
    do
        sleep 5
    done
    curl --silent -H "Content-Type: application/yaml" -XPOST -d"$(cat /srv/kubernetes/manifests/kube-dns-rc.yaml)" "http://127.0.0.1:8080/api/v1/namespaces/kube-system/replicationcontrollers" > /dev/null
    curl --silent -H "Content-Type: application/yaml" -XPOST -d"$(cat /srv/kubernetes/manifests/kube-dns-svc.yaml)" "http://127.0.0.1:8080/api/v1/namespaces/kube-system/services" > /dev/null
    curl --silent -H "Content-Type: application/yaml" -XPOST -d"$(cat /srv/kubernetes/manifests/heapster-de.yaml)" "http://127.0.0.1:8080/apis/extensions/v1beta1/namespaces/kube-system/deployments" > /dev/null
    curl --silent -H "Content-Type: application/yaml" -XPOST -d"$(cat /srv/kubernetes/manifests/heapster-svc.yaml)" "http://127.0.0.1:8080/api/v1/namespaces/kube-system/services" > /dev/null
    curl --silent -H "Content-Type: application/yaml" -XPOST -d"$(cat /srv/kubernetes/manifests/kube-dashboard-rc.yaml)" "http://127.0.0.1:8080/api/v1/namespaces/kube-system/replicationcontrollers" > /dev/null
    curl --silent -H "Content-Type: application/yaml" -XPOST -d"$(cat /srv/kubernetes/manifests/kube-dashboard-svc.yaml)" "http://127.0.0.1:8080/api/v1/namespaces/kube-system/services" > /dev/null
}

systemctl stop update-engine; systemctl mask update-engine

systemctl daemon-reload

systemctl enable flanneld; systemctl start flanneld
systemctl enable kubelet; systemctl start kubelet

start_addons
