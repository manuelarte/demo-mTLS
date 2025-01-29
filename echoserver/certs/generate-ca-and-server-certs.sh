CA_SUBJECT="/C=NL/ST=North Holland/L=AMS/O=manuelarte/OU=IT/CN=rootCA"

echo "Generate CA key"
# Generate a 4096-bit private key for the CA
openssl genrsa -out "ca.key" 4096

echo "Generate CA certificate"
openssl req -x509 -new -nodes -key "ca.key" -sha256 -days 365 -out "ca.crt" -subj "$CA_SUBJECT"

echo "Generate server side key and certificate"
openssl req -nodes -x509 -sha256 -newkey rsa:4096 \
      -keyout key.pem \
      -subj /C=NL/ST=NH/O=ING/CN=echoserver-envoy-service \
      -out cert.pem \
      -addext subjectAltName=DNS:echoserver-envoy-service
