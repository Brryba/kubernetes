cd kafka || exit
helm install kafka .
cd ..

cd auth || exit
helm dependency update
helm install auth-service-release .
cd ..

cd user || exit
helm dependency update
helm install user-service-release .
cd ..

cd order || exit
helm dependency update
helm install order-service-release .
cd ..

cd payment || exit
helm dependency update
helm install payment-service-release .
cd ..

cd gateway || exit
helm dependency update
helm install api-gateway-release .
cd ..

helm install ingress ingress/.

helm install react-frontend frontend/.