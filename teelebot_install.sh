debian_install(){
    apt-get update
    apt-get -y install git
    apt-get -y install screen
    cd /root
    git clone https://github.com/plutobell/teelebot.git
    apt-get -y install python3-pip
    pip3 install captcha beautifulsoup4 lxml requests
    read -p "请输入你的机器人token：" token
    read -p "请输入你的用户id：" id
    mkdir /root/.teelebot/
    touch /root/.teelebot/config.cfg
    echo "[config]
key=$token
pool_size=40
webhook=False
cert_pub=your public certificate dir //Optional while webhook is False
server_ip=your server ip address //Optional while webhook is False
server_port=your server port //Optional while webhook is False
local_address=webhook local address //Optional while webhook is False
local_port=webhook local port //Optional while webhook is False
root=$id
debug=False
timeout=60
plugin_dir=/root/teelebot/plugins/" > /root/.teele/config.cfg
    screen -dmS teelebot cd /root/teelebot & python3 -m teelebot
    echo"安装完成 请输入screen -r teelebot 查看运行情况\n"
    echo"如果出现报错 请反馈给我 "
    echo"网址：https://southcat.net"

}

ubuntu_install(){
    apt-get update
    apt-get -y install git
    apt-get -y install screen
    cd /root
    git clone https://github.com/plutobell/teelebot.git
    apt-get -y install python3-pip
    pip3 install captcha beautifulsoup4 lxml requests
    read -p "请输入你的机器人token：" token
    read -p "请输入你的用户id：" id
    mkdir /root/.teelebot/
    touch /root/.teelebot/config.cfg
    echo "[config]
key=$token
pool_size=40
webhook=False
cert_pub=your public certificate dir //Optional while webhook is False
server_ip=your server ip address //Optional while webhook is False
server_port=your server port //Optional while webhook is False
local_address=webhook local address //Optional while webhook is False
local_port=webhook local port //Optional while webhook is False
root=$id
debug=False
timeout=60
plugin_dir=/root/teelebot/plugins/" > /root/.teele/config.cfg
    screen -dmS teelebot cd /root/teelebot & python3 -m teelebot
    echo"安装完成 请输入screen -r teelebot 查看运行情况\n"
    echo"如果出现报错 请反馈给我 "
    echo"网址：https://southcat.net"
}

centos_install(){
    yum update
    yum -y install git
    yum -y install screen
    cd /root
    git clone https://github.com/plutobell/teelebot.git
    pip3 install captcha beautifulsoup4 lxml requests
    read -p "请输入你的机器人token：" token
    read -p "请输入你的用户id：" id
    mkdir /root/.teelebot/
    touch /root/.teelebot/config.cfg
    echo "[config]
key=$token
pool_size=40
webhook=False
cert_pub=your public certificate dir //Optional while webhook is False
server_ip=your server ip address //Optional while webhook is False
server_port=your server port //Optional while webhook is False
local_address=webhook local address //Optional while webhook is False
local_port=webhook local port //Optional while webhook is False
root=$id
debug=False
timeout=60
plugin_dir=/root/teelebot/plugins/" > /root/.teele/config.cfg
    screen -dmS teelebot cd /root/teelebot & python3 -m teelebot
    echo"安装完成 请输入screen -r teelebot 查看运行情况\n"
    echo"如果出现报错 请反馈给我 "
    echo"网址：https://southcat.net"
    
}



system_check(){
    echo"作者：南猫"
    echo"博客：https://southcat.net"
    echo"请现在botfather提前创建机器人并准备token"
    result=$(grep -o -E 'Red Hat|Ubuntu|Debian' /proc/version | uniq | head -n 1)
case $result in
    'Red Hat' )
        echo "\e[1;32m 检测到您的系统是Red Hat/Centos，即将进入安装 \e[0m";
        centos_install
        ;;
    'Ubuntu' )
        echo "\e[1;32m 检测到您的系统是Ubuntu，即将进入安装 \e[0m";
        ubuntu_install
        ;;
    'Debian' )
        echo "\e[1;32m 检测到您的系统是Debian，即将进入安装 \e[0m";
        debian_install
        ;;
    *)
        echo "\e[1;32m 脚本仅支持Debian/Ubuntu/Red Hat/Centos \e[0m";
        ;;
esac
}

system_check