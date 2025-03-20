helm uninstall owdev -n openwhisk
kubectl delete -f ./deployment/Part01-database/*
kubectl delete -f ./deployment/Part02-backend/service/
kubectl delete -f ./deployment/Part03-frontend/*
