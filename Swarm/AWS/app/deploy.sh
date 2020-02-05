#!/bin/bash

pwd=$( dirname $( readlink -f $0 ) ) ;

test -z "$stack" && echo PLEASE DEFINE THE VALUE FOR stack && exit 1 ;

source $pwd/docker/Swarm/AWS/common/functions.sh

command="cd && git clone https://github.com/secobau/ucp.git && sudo docker stack deploy -c ucp/aws/php.yml php && sudo docker stack deploy -c ucp/aws/dockercoins.yml dockercoins" ;
targets=" InstanceManager1 " ;
for target in $targets ; do
 send_command "$command" "$target" "$stack" ;
done ;
