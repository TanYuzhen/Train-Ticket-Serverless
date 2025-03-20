本教程对TrainTicket无服务器BenchMark进行部署指导：

<h2 id="i3IfX">1.OpenWhisk部署</h2>
```bash
wget -c https://services.gradle.org/distributions/gradle-5.5.1-bin.zip -P /tmp
sudo unzip -d /opt/gradle /tmp/gradle-5.5.1-bin.zip
export GRADLE_HOME=/opt/gradle/gradle-5.5.1
export PATH=${GRADLE_HOME}/bin:${PATH}::：：q 

git clone git@github.com:TanYuzhen/Train-Ticket-Serverless.git
cd ./Train-Ticket-Serverless
cp ./bin/wsk /usr/local/bin
cp ./bin/wskdeploy /usr/local/bin
```

首先，给每个Work Node打上标签，使OpenWhisk生成的函数Pod能够调度到相应的Work Node上

```bash
kubectl label nodes <your_k8s_cluster_work_node> openwhisk-role=invoker
```

通过`helm`在K8s中部署相关组件

```bash
export ${MASTER_IP}=<your_own_k8s_cluster_master_host_ip>
helm uninstall owdev -n openwhisk
helm install owdev ./helm/openwhisk --create-namespace -n openwhisk -f ./OpenWhiskCluster.yaml
```

等待`owdev-gen-certs-vwwh8`、`owdev-init-couchdb-c4nqx`、`owdev-install-packages-xddvg`这3个`Join`完成后，完成OpenWhisk在K8s上的部署

![](https://cdn.nlark.com/yuque/0/2025/png/49878225/1742450935660-75e79108-3461-4beb-94bc-725e0fa7c108.png)

![](https://cdn.nlark.com/yuque/0/2025/png/49878225/1742451058794-f01451ca-3895-4641-bc9e-6666d569efd9.png)

其中`owdev-*`是OpenWhisk自己内部的组件，而wskowdeb-invoker-*则是OpenWhisk在调用函数时，进行冷启动生成的Pod，运行相应的函数；

```bash
wsk property set --apihost ${MASTER_IP}:31001
wsk property set --auth 23bc46b1-71f6-4ed5-8c54-816aa4f8c502:123zO3xZCLrMN6v2BKK1dXYFpXlPkccOFqm12CdAsMgRU4VrNZ9lyGVCGuMDGIwP
```

<h2 id="aqYB3">2.Train Ticket Serverless相关组件部署</h2>
```bash
cd ./train_ticket
./init.sh
```

访问其前端，进行交互操作

![](https://cdn.nlark.com/yuque/0/2025/png/49878225/1742452426589-8bfb580c-2e24-4e66-b334-c1f38e20f477.png)

