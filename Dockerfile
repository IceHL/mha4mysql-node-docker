FROM mysql:5.7

# 更新apt-get源
RUN echo 'deb http://mirrors.aliyun.com/debian/ buster main non-free contrib\n\
    deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib\n\
    deb http://mirrors.aliyun.com/debian-security buster/updates main\n\
    deb-src http://mirrors.aliyun.com/debian-security buster/updates main\n\
    deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib\n\
    deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib\n\
    deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib\n\
    deb-src http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib\n' >/etc/apt/sources.list     

# 下载依赖组件
RUN build_deps='ssh mha4mysql-node' \
    && apt-get update \
    && apt-get -y install $build_deps \
    && apt-get clean
