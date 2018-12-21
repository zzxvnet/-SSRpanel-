#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo "请输入 数据库地址 > " ; read mip
echo "请输入 数据库端口 > " ; read mport
echo "请输入 数据库用户名 > " ; read mid
echo "请输入 数据库密码 > " ; read mpass
echo "请输入 节点ID > " ; read nid
echo "请输入 节点费率 > " ; read nfee
echo "API_NODE_ID = '$nid'" >> /root/shadowsocks-py-mu/shadowsocks/config.py
clear
echo
echo "#############################################################"
echo "# One click Install ShadowsocksR-Python Manyusers Version    #"
echo "# Author: mzfqy <mzfqy@qq.com>                       #"
echo "#############################################################"

echo
echo 正在设置时区
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime -r
echo 正在关闭防火墙
systemctl stop firewalld.service >/dev/null 2>&1
systemctl disable firewalld.service>/dev/null 2>&1
echo 正在配置准备环境
yum remove nc -y >/dev/null 2>&1
rpm -ivh ncat-7.60-1.x86_64.rpm >/dev/null 2>&1
ln -s /usr/bin/ncat /bin/nc
cd /root
正在配置ssr
git clone https://github.com/mzfqy/shadowsocksr
chmod 777 * -R
cd shadowsocksr
echo "{\"host\":\"127.0.0.1\",\"port\": 3306,\"user\": \"ssrpanel\",\"password": \"pass",\"db\": \"ssrpanel\",\"node_id\": 0,\"transfer_mul\": 1.0,\"ssl_enable\": 0,\"ssl_ca\": \"\",\"ssl_cert\": \"\",\"ssl_key\": \"\"}” >usermysql.json
mv A /bin
mv B /bin
mv C /bin
mv D /bin
mv ssx /bin
crontab cron