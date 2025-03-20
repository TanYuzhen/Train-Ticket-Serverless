set -ex
#bash part01_DataBaseDeployment_owk.sh
#bash part02_FaaSFunctions_owk.sh java:8
#cd ./src/load-gen/utils/
#python3 ./src/load-gen/utils/get_action_api.py
#cd ../../..
bash part01_DataInitiation_owk.sh java:8
bash part02_BaaSServices.sh
bash part03_Frontend.sh
