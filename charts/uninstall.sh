helm uninstall auth-service-release
helm uninstall auth-postgres

helm uninstall user-service-release
helm uninstall user-postgres
helm uninstall user-redis

helm uninstall order-service-release
helm uninstall order-postgres

helm uninstall kafka