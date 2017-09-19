#!/bin/bash

#subflow1 of ship1 goes to port 3, subflow2 of ship1 goes to port 4 
sudo ovs-ofctl add-flow s1 ip,nw_src=10.0.1.0/32,actions=set_queue:1,output:3
sudo ovs-ofctl add-flow s1 ip,nw_src=10.0.1.1/32,actions=set_queue:2,output:4
sudo ovs-ofctl add-flow s1 in_port=3,actions=normal
sudo ovs-ofctl add-flow s1 in_port=4,actions=normal
sudo ovs-ofctl add-flow s1 priority=100,actions=normal #default L2 forwarding policy, low priority flow entry


#subflow1 of ship2 goes to port 3, subflow2 of ship2 goes to port 4 
sudo ovs-ofctl add-flow s2 ip,nw_src=10.0.2.0/32,actions=set_queue:3,output:3
sudo ovs-ofctl add-flow s2 ip,nw_src=10.0.2.1/32,actions=set_queue:4,output:4
sudo ovs-ofctl add-flow s2 in_port=3,actions=normal
sudo ovs-ofctl add-flow s2 in_port=4,actions=normal
sudo ovs-ofctl add-flow s2 priority=100,actions=normal


#subflow1(flow) of ship3 goes to port 4 
sudo ovs-ofctl add-flow s3 ip,nw_src=10.0.3.0/32,actions=set_queue:5,output:2
sudo ovs-ofctl add-flow s3 in_port=2,actions=normal
sudo ovs-ofctl add-flow s3 priority=100,actions=normal


#subflow1 of ship4 goes to port 3, subflow2 of ship4 goes to port 4 
sudo ovs-ofctl add-flow s4 ip,nw_src=10.0.4.0/32,actions=set_queue:6,output:3
sudo ovs-ofctl add-flow s4 ip,nw_src=10.0.4.1/32,actions=set_queue:7,output:4
sudo ovs-ofctl add-flow s4 in_port=3,actions=normal
sudo ovs-ofctl add-flow s4 in_port=4,actions=normal
sudo ovs-ofctl add-flow s4 priority=100,actions=normal

#subflow1 of ship5 goes to port 3, subflow2 of ship5 goes to port 4 
sudo ovs-ofctl add-flow s5 ip,nw_src=10.0.5.0/32,actions=set_queue:8,output:3
sudo ovs-ofctl add-flow s5 ip,nw_src=10.0.5.1/32,actions=set_queue:9,output:4
sudo ovs-ofctl add-flow s5 in_port=3,actions=normal
sudo ovs-ofctl add-flow s5 in_port=4,actions=normal
sudo ovs-ofctl add-flow s5 priority=100,actions=normal


sudo ovs-ofctl add-flow s6 in_port=2,actions=output:1
sudo ovs-ofctl add-flow s6 in_port=3,actions=output:1
sudo ovs-ofctl add-flow s6 in_port=4,actions=output:1
sudo ovs-ofctl add-flow s6 in_port=5,actions=output:1
sudo ovs-ofctl add-flow s6 in_port=1,actions=normal
sudo ovs-ofctl add-flow s6 priority=100,actions=normal

sudo ovs-ofctl add-flow s7 in_port=2,actions=output:1
sudo ovs-ofctl add-flow s7 in_port=3,actions=output:1
sudo ovs-ofctl add-flow s7 in_port=4,actions=output:1
sudo ovs-ofctl add-flow s7 in_port=1,actions=normal
sudo ovs-ofctl add-flow s7 priority=100,actions=normal



sudo ovs-ofctl add-flow s8 in_port=2,actions=output:1
sudo ovs-ofctl add-flow s8 in_port=3,actions=output:1
sudo ovs-ofctl add-flow s8 in_port=1,actions=normal
sudo ovs-ofctl add-flow s8 priority=100,actions=normal


sudo ovs-ofctl add-flow s9 in_port=2,actions=output:1
sudo ovs-ofctl add-flow s9 in_port=3,actions=output:1
sudo ovs-ofctl add-flow s9 in_port=4,actions=output:1
sudo ovs-ofctl add-flow s9 in_port=1,actions=output:normal
sudo ovs-ofctl add-flow s8 priority=100,actions=normal
