# Examples

The `up` script starts example services.   The services are r1-r6 (Redis instances), s1-s6 (Sentinel instances), and haproxy, an haproxy instance in front of the 6 redis instances.

```bash
$ ./up all
Starting r1
Starting s1
Starting r2
Starting s2
Starting r3
Starting s3
Starting r4
Starting s4
Starting r5
Starting s5
Starting r6
Starting s6
Starting haproxy
```

```bash
$ ./status
Redis 6661: slave  127.0.0.1 6664
Redis 6662: slave  127.0.0.1 6664
Redis 6663: slave  127.0.0.1 6664
Redis 6664: master
Redis 6665: slave  127.0.0.1 6664
Redis 6666: slave  127.0.0.1 6664
sentinel 7661
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
sentinel 7662
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
sentinel 7663
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
sentinel 7664
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
sentinel 7665
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
sentinel 7666
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
```

The `down` script stops the services that `up` starts.  These can be one at a time, or all at once.

```bash
$ ./down r4
$ ./status
Redis 6661: slave  127.0.0.1 6664
Redis 6662: master
Redis 6663: slave  127.0.0.1 6664
Redis 6664: offline
Redis 6665: slave  127.0.0.1 6664
Redis 6666: slave  127.0.0.1 6664
sentinel 7661
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
sentinel 7662
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
sentinel 7663
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
sentinel 7664
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
sentinel 7665
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
sentinel 7666
  master: 127.0.0.1 6664
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6664
    127.0.0.1:6662 -> 127.0.0.1:6664
    127.0.0.1:6663 -> 127.0.0.1:6664
    127.0.0.1:6665 -> 127.0.0.1:6664
    127.0.0.1:6666 -> 127.0.0.1:6664
```

Then wait for the sentinels to catch up, and run `status` again.

```bash
$./status
Redis 6661: slave  127.0.0.1 6662
Redis 6662: master
Redis 6663: slave  127.0.0.1 6662
Redis 6664: offline
Redis 6665: slave  127.0.0.1 6662
Redis 6666: slave  127.0.0.1 6662
sentinel 7661
  master: 127.0.0.1 6662
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6662
    127.0.0.1:6663 -> 127.0.0.1:6662
    127.0.0.1:6664 -> ?:0
    127.0.0.1:6665 -> 127.0.0.1:6662
    127.0.0.1:6666 -> 127.0.0.1:6662
sentinel 7662
  master: 127.0.0.1 6662
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6662
    127.0.0.1:6663 -> 127.0.0.1:6662
    127.0.0.1:6664 -> ?:0
    127.0.0.1:6665 -> 127.0.0.1:6662
    127.0.0.1:6666 -> 127.0.0.1:6662
sentinel 7663
  master: 127.0.0.1 6662
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6662
    127.0.0.1:6663 -> 127.0.0.1:6662
    127.0.0.1:6664 -> ?:0
    127.0.0.1:6665 -> 127.0.0.1:6662
    127.0.0.1:6666 -> 127.0.0.1:6662
sentinel 7664
  master: 127.0.0.1 6662
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6662
    127.0.0.1:6663 -> 127.0.0.1:6662
    127.0.0.1:6664 -> ?:0
    127.0.0.1:6665 -> 127.0.0.1:6662
    127.0.0.1:6666 -> 127.0.0.1:6662
sentinel 7665
  master: 127.0.0.1 6662
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6662
    127.0.0.1:6663 -> 127.0.0.1:6662
    127.0.0.1:6664 -> ?:0
    127.0.0.1:6665 -> 127.0.0.1:6662
    127.0.0.1:6666 -> 127.0.0.1:6662
sentinel 7666
  master: 127.0.0.1 6662
  slaves: 
    127.0.0.1:6661 -> 127.0.0.1:6662
    127.0.0.1:6663 -> 127.0.0.1:6662
    127.0.0.1:6664 -> ?:0
    127.0.0.1:6665 -> 127.0.0.1:6662
    127.0.0.1:6666 -> 127.0.0.1:6662
```

After this, the original docs follow.

# Redis HA - sentinel + haproxy

- sentinel: autoswitch master/slave
- haproxy: active check for only master node
- haproxy api: disable failed nodes to prevent multimaster

!["diagram"](diagram.png)

without haproxy maintenance mode
```
  A is master, B is slave
  A crashes, sentinel convert B to master
  A is recovered (still master)
  haproxy balancing between A and B, until sentinel convert A to slave
  data written to A are lost
```

witch haproxy maintenance mode via notification script
```
  A is master, B is slave
  A crashes, sentinel convert B to master
  haproxy disable A
  A is recovered (still master) but disabled in haproxy
  haproxy points only to B
```

### Run redis cluster
```
redis-server --port 6666
redis-server --port 6667
redis-server --port 6668
```

### Set slaves
```
redis-cli -p 6667 SLAVEOF 127.0.0.1 6666
redis-cli -p 6668 SLAVEOF 127.0.0.1 6666
```

### Run sentinel
```
redis-server sentinel.conf  --sentinel
```

### Run haproxy
```
haproxy -f haproxy.cfg -db
```

Open http://localhost:8080/ and try kill some redis


### Notice
tested on
- redis 2.8.6
- haproxy 1.5-dev21

[!] in production on single host you must specify different data dir before SLAVEOF command otherwise you loose data on master
