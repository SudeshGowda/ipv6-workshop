sudo ip link add br0 type bridge
sudo ip link set eth0 master br0 
sudo ip link set dev br0 up
