#
# Openstack SysPrepper v1.0
# Script name : ci_ftpserver.sh
# Purpose: Install/Configure FTP Server 
# to upload/download files from new VM's
# Date 6/3/2015
# Author : Nauman
#!/bin/bash
echo " VSFTPD Server Installation "
echo " downloading & install vsftpd package "
yum install vsftpd -y
echo " Configuring VSFTP Server "
echo " But first backup /etc/vsftpd/vsftpd.conf"
cp  /etc/vsftpd/vsftpd.conf ~/vsftpd.conf.orig
echo " We'll ENABLE anonymouse login & local users "
echo " Disable anonymous FTP login by commenting it out "
#echo "anonymous_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "Enabling local user logins "
echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf
echo " We also need to allow FTP connection coming in via Firewall"
firewall-cmd --permanent --add-port=21/tcp
firewall-cmd --reload
echo " All done , now restart & enable FTP loading at startup"
service vsftpd restart
chkconfig vsftpd on