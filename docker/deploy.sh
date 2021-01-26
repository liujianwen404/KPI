docker rm -f $(docker ps -a |  grep "zentao-kpi*"  | awk '{print $1}')
docker pull registry.cn-shenzhen.aliyuncs.com/kuaima/zentao-kpi:latest
docker run -d --name="zentao-kpi" -m 2G -e JAVA_OPS="-Xms512m -Xmx2024m" -e PROFILES="--spring.profiles.active=verify " -p 5200:5200 registry.cn-shenzhen.aliyuncs.com/kuaima/zentao-kpi:latest
docker logs $(docker ps -a |  grep "zentao-kpi*"  | awk '{print $1}')
