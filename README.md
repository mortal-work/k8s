# explain 
Хотелсь построить scalable решение. К сожалению использование cluster mode подразумевает redis-cli cluster create и не скейлится на лету.

Исходя из концепта сетевой доступности можно повесить контенер с cluster create в statefulset, но нужно будет как то формировать список нод кластера:

Так-же при каждом scale нужно будет делать пересоздание кластера на основании реплик. Как повесить такой хук в кубере я не знаю, но очень интересно.

Поэтому оставляю это решение, которое поддерживает scale. Несколько отлично от тз, но это задел именно в scale

Запуск - **run.sh**

# Решение. ToDo
Идеальный вариант для k8s - redis sentinel
https://rtfm.co.ua/redis-replikaciya-chast-2-master-slave-replikaciya-i-redis-sentinel

# p.s.
p.s.1: Приблизительный конфиг для minikube в директории .kube

p.s.2: Для решения проблем в minikube c днс в корп. сеть без подключенного впн - таймауты при опросе (ибо на ubuntu 20.04 systemd-resolved): 

To avoid a "Search Line limits were exceeded, some search paths have been omitted, the applied search line is"
You should use ip adress for dns resolve

kubectl -n kube-system edit configmap coredns

forward . 8.8.8.8 {
           max_concurrent 1000
        }

# k8s
