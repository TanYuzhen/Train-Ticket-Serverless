helm uninstall owdev -n openwhisk
rm -rf /srv/nfs/kubedata/station
rm -rf /srv/nfs/kubedata/auth
rm -rf /srv/nfs/kubedata/config
rm -rf /srv/nfs/kubedata/contacts
rm -rf /srv/nfs/kubedata/insidePayment
rm -rf /srv/nfs/kubedata/order
rm -rf /srv/nfs/kubedata/payment
rm -rf /srv/nfs/kubedata/price
rm -rf /srv/nfs/kubedata/route
rm -rf /srv/nfs/kubedata/security
rm -rf /srv/nfs/kubedata/train
rm -rf /srv/nfs/kubedata/travel
rm -rf /srv/nfs/kubedata/user
kubectl delete -f ./deployment/Part01-database/
kubectl delete -f ./deployment/Part02-backend/service/
kubectl delete -f ./deployment/Part03-frontend/
