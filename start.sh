#! /bin/bash

ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
             --remote=db:Open_vSwitch,Open_vSwitch,manager_options \
             --private-key=db:Open_vSwitch,SSL,private_key \
             --certificate=db:Open_vSwitch,SSL,certificate \
             --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
             --pidfile --detach \ 
             --log-file=/usr/local/var/log/openvswitchovsdb-server.log

sudo ovs-vsctl --no-wait init

#sudo ./vswitchd/ovs-vswitchd unix:/usr/local/var/run/openvswitch/db.sock \
#    -vconsole:emer -vsyslog:err -vfile:dbg --mlockall --no-chdir \
#    --log-file=/usr/local/var/log/openvswitch/ovs-vswitchd.log \
#    --pidfile=/usr/local/var/run/openvswitch/ovs-vswitchd.pid --detach --monitor --pidfile --detach

sudo ./vswitchd/ovs-vswitchd unix:/usr/local/var/run/openvswitch/db.sock \
     -vsyslog:err --mlockall --no-chdir \
    --log-file=/usr/local/var/log/openvswitch/ovs-vswitchd.log \
    --pidfile=/usr/local/var/run/openvswitch/ovs-vswitchd.pid --detach --monitor --pidfile --detach
