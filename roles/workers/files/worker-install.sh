#!/bin/bash

systemctl stop update-engine; systemctl mask update-engine

systemctl daemon-reload

systemctl enable flanneld; systemctl start flanneld
systemctl enable kubelet; systemctl start kubelet
