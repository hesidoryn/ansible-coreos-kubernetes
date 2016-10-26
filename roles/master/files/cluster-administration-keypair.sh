openssl genrsa -out /etc/kubernetes/ssl/admin-key.pem 2048
openssl req -new -key /etc/kubernetes/ssl/admin-key.pem -out /etc/kubernetes/ssl/admin.csr -subj "/CN=kube-admin"
openssl x509 -req -in /etc/kubernetes/ssl/admin.csr -CA /etc/kubernetes/ssl/ca.pem -CAkey /etc/kubernetes/ssl/ca-key.pem -CAcreateserial -out /etc/kubernetes/ssl/admin.pem -days 365
