#
# Openstack SysPrepper v1
# Script name : sys_backup.sh
# Purpose: backup the fresh installed backups to create the baseline
# Date 5/29/2015
# Author : Nauman
#!/bin/bash
echo "Creating System Directory Structure"
sleep 3
export root_dir=/root
export main_dir=/root/main
export main_bkups_dir=/root/main/backups
export sys_bkups_dir=/root/main/backups/sys_backup
export gold_configs=/root/main/gold_configs

 ### Create dirs by var name 
 if [ -d "$root_dir" ]; then 
  if [ -d "$main_dir" ]; then
    echo " Main Dir already exists "
    # Symbolic link specific commands go here.
   # rm "$LINK_OR_DIR"
  else
    echo "main dir doesnt exist creating one .."
    # Directory command goes here.
    mkdir -p $main_dir
  fi
  if [ -d "$main_bkups_dir" ]; then
    echo " Main Backups Dir already exists "
    # Symbolic link specific commands go here.
   # rm "$LINK_OR_DIR"
  else
    echo "Main Backuos dir doesnt exist , creating one .."
    # Directory command goes here.
    mkdir -p $main_bkups_dir
  fi
  if [ -d "$sys_bkups_dir" ]; then
    echo " Sys Backups Directoryr already exists "
    # Symbolic link specific commands go here.
   # rm "$LINK_OR_DIR"
  else
    echo "main dir doesnt exist creating one .."
    # Directory command goes here.
    mkdir -p $sys_bkups_dir
  fi	
  if [ -d "$gold_configs" ]; then
    echo " Gold Configs Directoryr already exists "
    # Symbolic link specific commands go here.
   # rm "$LINK_OR_DIR"
  else
    echo "Gold Configs dir doesnt exist, creating one .."
    # Directory command goes here.
    mkdir -p $gold_configs
  fi	
fi
cp --parents /etc/ssh/sshd_config $sys_bkups_dir
cp --parents /etc/networks $sys_bkups_dir
cp --parents /etc/hostname $sys_bkups_dir
cp --parents /etc/selinux/config $sys_bkups_dir
cp --parents /etc/yum.conf $sys_bkups_dir
cp --parents /etc/sudoers $sys_bkups_dir
cp --parents /etc/hosts $sys_bkups_dir

#mkdir -p $main_dir
#mkdir -p $main_bkups_dir
#mkdir -p $sys_bkups_dir
ls -Rt

#cp --parents $gold_configs/sshd_config  /etc/ssh/sshd_config
#cp --parents $gold_configs/networks	 /etc/networks
#cp --parents $gold_configs/hostname  	/etc/hostname 
#cp --parents $gold_configs/selinux_config /etc/selinux/config 
#cp --parents $gold_configs/yum.conf  /etc/yum.conf 
#cp --parents $gold_configs/sudoers  /etc/sudoers
#cp --parents $gold_configs/hosts  /etc/hosts





