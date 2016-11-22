# Draft ansible playbook for installing redis

This is mostly an ansible playbook.  But it also includes a multibox vagrant file for testing.

## Overview:

This playbook operates on three groups: 
* redis-server
* redis-sentinel
* haproxy

Extra bits:

* A systemd unit for `redis-sentinel`.
* An override for the package systemd unit for `redis-server`.
* `/etc/haredis/haproxy.cfg`. The configuration for haproxy.
* `/etc/redis/redis_custom.conf` Loads the base redis-server configuration then overrides based on inventory.
* `/etc/redis/sentinel_custom.conf` Loads base redis-sentinel configuration then overrides to match inventory.
* `/usr/lib/redis/notification.sh` A script used by redis-sentinel.

## Demo

The `Vagrantfile` creates three stock Debian 8 boxes with `vagrant up`.
It uses the ansible provisioner to apply the playbook.

Once it finishes installing visit [http://192.168.90.30:8080/](http://192.168.90.30:8080) to see the haproxy

The important bits for the stats pages should be same, but it's worth having all the links if you'll be testing failover by shutting down a host.

The redis primary should be redis-sever-1 when it first starts up.  The sentinels handle failover, and the runtime configuration for redis-server and redis-sentinel keeps track of newly promoted and demoted primaries.

You'll want to monitor the stats page on redis-sever-2 or redis-sever-3 since redis-sever-1 will be down for tests.  To test failover, run `vagrant halt redis-sever-1`.  The haproxy backend redis-primary should indicate the others as healthy.  Bring redis-sever-1 back with `vagrant up redis-sever-1`, and you'll see that the redis-primary continues to point at redis-sever-2.  That's desired.  It's assumed that the data in redis-sever-1 is now stale and it needs to spend time as a replica.

You may be tempted to try failing two servers at once.  The sentinels have a quorum set to 2, and won't be able to reach consensus to failover at that point. Also, if you fail servers one at a time leaving the primary last.  And restart them in the same order, the two replica sentinels will get confused and won't try to elect a new master.  I suspect it's fairly unusual to host a sentinel on each redis server, and it may be a better idea to split them off to separate servers.
