openssl genrsa -out /etc/kubernetes/ssl/worker-key.pem 2048
openssl req -new -key /etc/kubernetes/ssl/worker-key.pem -out /etc/kubernetes/ssl/worker.csr -subj "/CN=worker" -config /etc/kubernetes/ssl/worker-openssl.cnf
openssl x509 -req -in /etc/kubernetes/ssl/worker.csr -CA /etc/kubernetes/ssl/ca.pem -CAkey /etc/kubernetes/ssl/ca-key.pem -CAcreateserial -out /etc/kubernetes/ssl/worker.pem -days 365 -extensions v3_req -extfile /etc/kubernetes/ssl/worker-openssl.cnf
