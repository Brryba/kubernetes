helm install auth-postgres bitnami/postgresql -f auth/postgres/postgres-values.yaml

sleep 10

cd auth/microservice || exit
helm dependency update
helm install auth-service-release .
cd ../..