echo "Creating the private key for the client certificate"
openssl genrsa -out client.key 4096

echo "Generate certificate request for the client certificate"
openssl req -new -sha256 \
  -key client.key \
  -subj /O=ING/DC=manuelarte/CN=localhost \
  -out client.csr
echo "Sign the request with the saved CA to create the client certificate"
openssl x509 -req \
  -in client.csr \
  -CA ca.crt \
  -CAkey ca.key \
  -out client.crt \
  -days 365 -sha256 -CAcreateserial \
  -extfile <(printf "subjectAltName=DNS:localhost,DNS:manuelarte")