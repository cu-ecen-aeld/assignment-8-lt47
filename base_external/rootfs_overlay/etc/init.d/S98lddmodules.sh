#!/bin/sh

case "$1" in
  start)

    echo "Loading LDD modules..."
    insmod /lib/modules/$(uname -r)/extra/scull.ko
    insmod /lib/modules/$(uname -r)/extra/hello.ko
    insmod /lib/modules/$(uname -r)/extra/faulty.ko
    ;;

  stop)

    echo "Unloading LDD modules..."

    rmmod faulty
    rmmod hello
    rmmod scull
    ;;
  *)
    echo "Usage: $0 {start|stop}"
    exit 1
    ;;
esac
