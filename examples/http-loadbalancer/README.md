# Quick start guide

## Make my http container balanced

1. Open Consul UI usualy ```http://<master-1 host>:8500``` or you can run ```./open_webui.sh```.
2. Find a ```service name``` for service you want to balance, for hdfs it is ```hdfs-http```.
3. Copy ```marathon/hdfs-nn-lb-http.json``` to ```[whatever you need].json```.
4. Change ```"id": "/hdfs/http-lb"``` and ```"BACKEND_SERVICE_NAME": "hdfs-http"``` in it.
5. And run ```./marathon-push.sh [whatever you need].json```.
6. Find a load balancer service in consul UI.
7. Now you can add more instances of this service and they will be automaticaly included.
8. Greate...

> REMEMBER: Service name is not always the same as marathon id it can be different if container has more than one port.
