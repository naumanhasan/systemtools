#
# Openstack System Prepper v1.0
# Script name : set_rcfiles.sh
# Purpose: Copy SysPrepper standard rc files to new Openstack hosts
# Date : 8/4/2015
# Author : Nauman
#!/bin/bash
# 
if [ $# -eq 0 ]
    then
      echo "No arguments supplied, use this script to copy bash/vim rc files to remote host "
              echo "Syntax : ./copy_rc_files <USERNAME@NEW_HOST>  <NEW_HOST_IP>"
                  exit 0
                fi
scp .bashrc $1@$2:/home/$1/
scp .vimrc  $1@$2:/home/$1/
              
