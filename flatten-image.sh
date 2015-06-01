#!/bin/bash

imagelist=(busybox haproxy aerospike oraclelinux julia crux tomcat crate wordpress golang jruby clojure jenkins iojs pypy ruby maven sentry rails hipchatbot pam glassfish dnsmasq drill build gcc)

#imagelist=(busybox haproxy)

for imagename in ${imagelist[*]};
do
	containerid=`docker run -d kiwenlau/$imagename:latest`

	docker export $containerid | docker import - kiwenlau/$imagename:flattened > /dev/null

	docker rm -f $containerid > /dev/null
	
	echo "kiwenlau/$imagename:fattened"	

	docker history kiwenlau/$imagename:flattened

	echo ""
done

