#!/bin/bash
apt-get install -y python-software-properties
add-apt-repository ppa:ubuntu-toolchain-r/test
apt update
apt install -y gcc-5 g++-5 make curl git
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 1 --slave /usr/bin/g++ g++ /usr/bin/g++-5
curl -L http://www.cmake.org/files/v3.4/cmake-3.4.1.tar.gz | tar -xvzf - -C /tmp/
cd /tmp/cmake-3.4.1/ && ./configure && make && sudo make install && cd -
update-alternatives --install /usr/bin/cmake cmake /usr/local/bin/cmake 1 --force
apt install -y libmicrohttpd-dev libssl-dev libhwloc-dev
git clone https://github.com/fireice-uk/xmr-stak-cpu xmr-stak
cd xmr-stak
#调整百分之二的开发者捐赠(强烈不建议这样做)
sed -i 's/0.0/0.0/g' donate-level.h
cmake .
make install
