set -e
echo "Part01 DataBase Deployment"

mkdir /srv/nfs/kubedata/station -p
mkdir /srv/nfs/kubedata/auth -p
mkdir /srv/nfs/kubedata/config -p
mkdir /srv/nfs/kubedata/contacts -p
mkdir /srv/nfs/kubedata/insidePayment -p
mkdir /srv/nfs/kubedata/order -p
mkdir /srv/nfs/kubedata/payment -p
mkdir /srv/nfs/kubedata/price -p
mkdir /srv/nfs/kubedata/route -p
mkdir /srv/nfs/kubedata/security -p
mkdir /srv/nfs/kubedata/train -p
mkdir /srv/nfs/kubedata/travel -p
mkdir /srv/nfs/kubedata/user -p
 

cd deployment/Part01-database/
# kubectl delete -f ts-serverless-database-deployment.yml
kubectl apply -f ts-serverless-database-deployment.yml

# kubectl delete -f ts-serverless-persistent-deployment.yml
kubectl apply -f ts-serverless-persistent-deployment.yml
cd ../..
echo "Part1 DataBase deployment finished"
