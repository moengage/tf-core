#!/bin/bash

# commands block ALL containers from using the instance profile credentials
# TODO: Make sure infra managements pods are not blocked before enabling it for nodes
#yum install -y iptables-services
#iptables --insert FORWARD 1 --in-interface eni+ --destination 169.254.169.254/32 --jump DROP
#iptables-save | tee /etc/sysconfig/iptables
#systemctl enable --now iptables

# Enable IPVS
yum install -y ipvsadm
ipvsadm -l
modprobe ip_vs
modprobe ip_vs_rr
modprobe ip_vs_wrr
modprobe ip_vs_sh
modprobe nf_conntrack_ipv4

# Sysctl changes
## Disable IPv6
cat <<EOF > /etc/sysctl.d/10-disable-ipv6.conf
# disable ipv6 config
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF

## Kube network optimisation.
## Stolen from this guy: https://blog.codeship.com/running-1000-containers-in-docker-swarm/
cat <<EOF > /etc/sysctl.d/99-kube-net.conf
# Have a larger connection range available
net.ipv4.ip_local_port_range=1024 65535

# The maximum number of "backlogged sockets".  Default is 128.
net.core.somaxconn=65535
net.core.netdev_max_backlog=65536

# 32MB per socket - which sounds like a lot,
# but will virtually never consume that much.
net.core.rmem_max=33554432
net.core.wmem_max=33554432

# Increase the maximum amount of option memory buffers
net.core.optmem_max=25165824

# Default Socket Receive Buffer
net.core.rmem_default=31457280

# Default Socket Send Buffer
net.core.wmem_default=31457280

# Various network tunables
# Increase the number of outstanding syn requests allowed.
net.ipv4.tcp_max_syn_backlog=20480
net.ipv4.tcp_max_tw_buckets=400000
net.ipv4.tcp_no_metrics_save=1

# Increase the maximum total buffer-space allocatable
# This is measured in units of pages (4096 bytes)
net.ipv4.tcp_mem=786432 1048576 26777216
net.ipv4.udp_mem=65536 131072 262144

# Increase the read-buffer space allocatable
net.ipv4.tcp_rmem=8192 87380 33554432
net.ipv4.udp_rmem_min=16384

# Increase the write-buffer-space allocatable
net.ipv4.tcp_wmem=8192 65536 33554432
net.ipv4.udp_wmem_min=16384

# Increase the tcp-time-wait buckets pool size to prevent simple DOS attacks
net.ipv4.tcp_max_tw_buckets=1440000
net.ipv4.tcp_tw_reuse=1
net.ipv4.tcp_fin_timeout=15

net.ipv4.tcp_syn_retries=2
net.ipv4.tcp_synack_retries=2
#vm.min_free_kbytes=65536
# Protect Against TCP Time-Wait
net.ipv4.tcp_rfc1337=1
# Control Syncookies
net.ipv4.tcp_syncookies=1

# Connection tracking to prevent dropped connections (usually issue on LBs)
net.netfilter.nf_conntrack_max=524288
net.ipv4.netfilter.ip_conntrack_generic_timeout=120
net.netfilter.nf_conntrack_tcp_timeout_established=86400

# ARP cache settings for a highly loaded docker swarm
net.ipv4.neigh.default.gc_thresh1=8096
net.ipv4.neigh.default.gc_thresh2=12288
net.ipv4.neigh.default.gc_thresh3=16384

# Increase size of file handles and inode cache
fs.file-max=2097152

# Do less swapping
vm.swappiness=10
vm.dirty_ratio=60
vm.dirty_background_ratio=2

fs.file-max=65536

# Sets the time before the kernel considers migrating a proccess to another core
kernel.sched_migration_cost_ns=5000000
EOF

cat <<EOT >> /etc/security/limits.conf
*               soft    nofile          65535
*               hard    nofile          65535
EOT

# Disable THP
cat <<EOF > /etc/rc.local
echo never > /sys/kernel/mm/transparent_hugepage/enabled
EOF

systemctl restart systemd-sysctl.service

%{ if cross_account_ecr_enabled }
su - ec2-user -c "$(aws ecr get-login --no-include-email --region us-east-1 --registry-ids ${registry_ids})"
FILE='/etc/crontab'
echo "0 */6 * * * ec2-user \$(aws ecr get-login --no-include-email --region us-east-1 --registry-ids ${registry_ids})" >> "$FILE"
%{ endif }

%{ if custom_dns_enabled }
export DNS_CLUSTER_IP=${custom_dns_ip}
%{ endif }

/etc/eks/bootstrap.sh --apiserver-endpoint '${cluster_endpoint}' \
    --b64-cluster-ca '${certificate_authority_data}' '${cluster_name}' \
    --kubelet-extra-args \
        "--kube-reserved cpu=100m,memory=0.5Gi,ephemeral-storage=1Gi \
        --system-reserved cpu=100m,memory=0.2Gi,ephemeral-storage=1Gi \
        --eviction-hard memory.available<500Mi,nodefs.available<10% \
        --allowed-unsafe-sysctls net.core.somaxconn \
        ${bootstrap_extra_args}"
