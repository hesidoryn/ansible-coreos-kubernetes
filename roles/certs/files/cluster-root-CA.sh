openssl genrsa -out ${HOME}/ca-key.pem 2048
openssl req -x509 -new -nodes -key ${HOME}/ca-key.pem -days 10000 -out ${HOME}/ca.pem -subj "/CN=kube-ca"
