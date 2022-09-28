#!/bin/bash
# vars
libraries="
expect
telnet
nkf
sysstat
dstat
"

disable_svcs="
firewalld
postfix
tuned
vdo
"

service_ctl() {
    while read disable_svc ;do
        if [ -n "$disable_svc" ] ;then
            sudo systemctl stop $disable_svc
            sudo systemctl disable $disable_svc
        fi
    done <<<$disable_svcs

    sudo setenforce 0
    sudo sed -i 's/^SELINUX=enforcing$/SELINUX=disabled/' /etc/selinux/config
}

install_library() {
    while library
    do
        if [ -n "$library" ] ; then
            sudo yum install -y $library
        fi
    done <<<$libraries

    sudo yum update -y
}

setup_locale() {
    sudo timedatectl set-timezone "Asia/Tokyo"
    sudo localectl set-locale LANG=ja_JP.UTF-8
    sudo localectl set-keymap LANG=jp
    sudo localectl set-x11-keymap LANG=jp
}

service_ctl
install_library
setup_locale
exit 0
