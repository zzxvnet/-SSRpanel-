#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
clear
echo
echo "#############################################################"
echo "# One click Install ShadowsocksR-Python Manyusers Version    #"
echo "# Author: mzfqy <mzfqy@qq.com>                       #"
echo "#############################################################"
echo "请输入 数据库地址 > " ;read mip
echo "请输入 数据库端口 > " ;read mport
echo "请输入 数据表名 > " ;read mname
echo "请输入 数据库用户名 > " ;read mid
echo "请输入 数据库密码 > " ;read mpass
echo "请输入 节点ID > " ;read nid
echo "请输入 节点费率 > " ;read nfee
echo Starting......
echo 正在设置时区
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime -r >/dev/null 2>&1
echo 正在关闭防火墙
systemctl stop firewalld.service >/dev/null 2>&1
systemctl disable firewalld.service>/dev/null 2>&1
iptables -F
service iptables save >/dev/null 2>&1
echo 正在配置准备环境
yum remove nc -y >/dev/null 2>&1
yum install git -y >/dev/null 2>&1
easy_install pip >/dev/null 2>&1
cd /root
wget https://raw.githubusercontent.com/mzfqy/OneClickSsr-ssrpanel/master/cron >/dev/null 2>&1
wget https://raw.githubusercontent.com/mzfqy/OneClickSsr-ssrpanel/master/ssr >/dev/null 2>&1
wget https://raw.githubusercontent.com/mzfqy/OneClickSsr-ssrpanel/master/ncat-7.60-1.x86_64.rpm>/dev/null 2>&1
wget https://raw.githubusercontent.com/mzfqy/OneClickSsr-ssrpanel/master/restartssr>/dev/null 2>&1
rpm -ivh ncat-7.60-1.x86_64.rpm >/dev/null 2>&1
ln -s /usr/bin/ncat /bin/nc >/dev/null 2>&1
cd /root
echo 正在安装libsodium
yum install wget m2crypto git libsodium -y >/dev/null 2>&1
yum -y groupinstall "Development Tools">/dev/null 2>&1
wget https://github.com/jedisct1/libsodium/releases/download/1.0.16/libsodium-1.0.16.tar.gz >/dev/null 2>&1
tar xf libsodium-1.0.16.tar.gz >/dev/null 2>&1
cd libsodium-1.0.16
./configure >/dev/null 2>&1
make -j2 >/dev/null 2>&1
make install >/dev/null 2>&1
echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
ldconfig
echo 正在配置ssr
cd /root
git clone https://github.com/mzfqy/shadowsocksr >/dev/null 2>&1
chmod 777 * -R
mv ssr /bin/ssr
mv restartssr /bin/restartssr
crontab cron
cd shadowsocksr
./setup_cymysql2.sh >/dev/null 2>&1
pip install -r requestment.txt >/dev/null 2>&1
rm usermysql.json -r
echo "{" >>usermysql.json
echo "    \"host\": \"$mip\"," >>usermysql.json
echo "    \"port\": \"$mport\"," >>usermysql.json
echo "    \"user\": \"$mid\"," >>usermysql.json
echo "    \"password\": \"$mpass\"," >>usermysql.json
echo "    \"db\": \"$mname\"," >>usermysql.json
echo "    \"node_id\": $nid," >>usermysql.json
echo "    \"transfer_mul\": $nfee," >>usermysql.json
echo "    \"ssl_enable\": 0," >>usermysql.json
echo "    \"ssl_ca\": \"\"," >>usermysql.json
echo "    \"ssl_cert\": \"\"," >>usermysql.json
echo "    \"ssl_key\": \"\"" >>usermysql.json
echo "}" >>usermysql.json
echo 安装完成
