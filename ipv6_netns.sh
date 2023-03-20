# VETH1_IPV6 = 1234::1/64
# VETH2_IPV6 = 1234::2/64

ip netns add host
ip netns add router

ip link add host_veth type veth peer name router_veth
ip link set host_veth netns host
ip link set router_veth netns router

ip netns exec host ip -6 addr add 1234::1/64 dev host_veth
ip netns exec router ip -6 addr add 1234::2/64 dev router_veth

ip netns exec host ip link set host_veth up
ip netns exec host ip link set lo up

ip netns exec router ip link set router_veth up
ip netns exec router ip link set lo up

