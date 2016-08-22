# Draft ansible playbook for installing redis

This is mostly an ansible playbook.  But it also includes a multibox vagrant file for testing.

## Overview:

This playbook installs debian packages:

* curl
* redis-server
* haproxy

Extra bits:

* A systemd unit for `redis-sentinel`.
* A replacement systemd unit for `redis-server`.
* `/etc/haredis/haproxy.cfg`. The configuration for haproxy.
* `/etc/redis/redis.conf` The base redis-server configuration. Included by the runtime configuration.
* `/etc/redis/sentinel.conf` The base redis-sentinel configuration. Included by the runtime configuration.
* `/usr/lib/redis/notification.sh` A script used by redis-sentinel.
* `/var/lib/redis/redis.conf` The runtime configuration for redis-server.
* `/var/lib/redis/sentinel.conf` The runtime configuration for redis-sentinel.

## Demo

The `Vagrantfile` creates three stock Debian 8 boxes with `vagrant up`.
It uses the ansible provisioner to apply the playbook.

Once it finishes installing visit [http://localhost:18080/](http://localhost:18080) to see the haproxy stats for r1.  
Or [http://localhost:28080/](http://localhost:28080) to see the haproxy stats for r2.  
Or [http://localhost:38080/](http://localhost:38080) to see the haproxy stats for r3.

The important bits for the stats pages should be same, but it's worth having all the links if you'll be testing failover by shutting down a host.

The redis primary should be r1 when it first starts up.  The sentinels handle failover, and the runtime configuration for redis-server and redis-sentinel keeps track of newly promoted and demoted primaries.

You'll want to monitor the stats page on r2 or r3 since r1 will be down for tests.  To test failover, run `vagrant halt r1`.  The haproxy backend redis-primary should indicate r2 or r3 as healthy.  Bring r1 back with `vagrant up r1`, and you'll see that the redis-primary continues to point at r2.  That's desired.  It's assumed that the data in r1 is now stale and it needs to spend time as a replica.

You may be tempted to try failing two servers at once.  The sentinels have a quorum set to 2, and won't be able to reach consensus to failover at that point. Also, if you fail servers one at a time leaving the primary last.  And restart them in the same order, the two replica sentinels will get confused and won't try to elect a new master.  I suspect it's fairly unusual to host a sentinel on each redis server, and it may be a better idea to split them off to separate servers.
