helm install auth-postgres bitnami/postgresql -f auth/postgres/postgres-values.yaml
helm install user-postgres bitnami/postgresql -f user/postgres/postgres-values.yaml
helm install order-postgres bitnami/postgresql -f order/postgres/postgres-values.yaml
helm install user-redis bitnami/redis -f user/redis/redis-values.yaml
helm install user-redis bitnami/redis -f payment/mongo/mongo-values.yaml

cd kafka || exit
helm install kafka .
cd ..

sleep 10

cd auth/microservice || exit
helm dependency update
helm install auth-service-release .
cd ../..

cd user/microservice || exit
helm dependency update
helm install user-service-release .
cd ../..

cd order/microservice || exit
helm dependency update
helm install order-service-release .
cd ../..

cd payment/microservice || exit
helm dependency update
helm install payment-service-release .
cd ../..

cd gateway || exit
helm dependency update
helm install payment-service-release .
cd ..