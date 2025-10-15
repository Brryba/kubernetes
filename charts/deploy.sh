helm install auth-postgres bitnami/postgresql -f auth/postgres/postgres-values.yaml
helm install user-postgres bitnami/postgresql -f postgres-values.yaml
helm install user-redis bitnami/redis -f redis-values.yaml

sleep 10

cd auth/microservice || exit
helm dependency update
helm install auth-service-release .

cd ../..
cd user/microservice || exit
helm dependency update
helm install user-service-release .
cd ../..