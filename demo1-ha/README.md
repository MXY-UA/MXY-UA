# HAProxy demo task

Here is simple example of using Load Balancer

Project builded with [docker-compose](https://docs.docker.com/compose/install/)

## Images that was used in project
- Flask web server + alpine build [@docker hub](https://hub.docker.com/r/jazzdd/alpine-flask)
- Own builded image with [http.server](https://docs.python.org/3/library/http.server.html) + python slim build [@dockerhub](https://hub.docker.com/_/python?tab=tags&page=1&ordering=last_updated)
- Official HAProxy [image](https://hub.docker.com/_/haproxy)
## Runing and testing

Too start project use:
```sh
# validate docker-compose.yml file
docker-compose config
# next run it
docker-compose up
```
To test how diffferend balancing algorithms work use _demo.sh_ file
or test it with some cycle commands:
```sh
for i in {1..20};do echo -n "Try number $i: "; curl -s 192.168.1.210 | grep -oE ">.+ Web server n.[0-9]"; done
```



