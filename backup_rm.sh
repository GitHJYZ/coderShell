#!/bin/bash

filename=$1
big_filesystem=./data/

if [ ! -e $1 ]
then
    echo "$1 不存在，请使用绝对路径"
    exit
fi
d=`date +%Y%m%d%H%M`
read -p "Are U sure delete the file or directory $1? y|n: " c
case $c in 
      y|Y)
          mkdir -p $big_filesystem/.$d && rsync -aR $1 $big_filesystem/.$d/$1 && /bin/rm -rf $1
          ;;
      n|N)
          exit 0
          ;;
      *)
          echo "Please input 'y' or 'n'."
          ;;
esac
