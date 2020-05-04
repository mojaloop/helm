### 1. Installation

Following guide provides information on how to install a scallable JMeter, InfluxDB, and Grafana environment.

It is recommended that JMeter is installed on own Kubernetes Cluster, or at a minimum ensure that JMeter is isolated on its own nodes/hardware.

#### 1.1. Install Helm Chart: 

- Refer to the following instructions for https://github.com/kaarolch/kubernetes-jmeter.
- The above link will provide Helm Charts to install a scalable JMeter, InfluxDB, and Grafana environment.

JMeter installation steps:
1. `helm repo add k8s-jmeter https://kaarolch.github.io/kubernetes-jmeter/charts/`
2. `helm install --namespace=<target-namespace> -n test k8s-jmeter/jmeter -f <custom-values-config>`
