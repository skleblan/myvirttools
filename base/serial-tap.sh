if [ $EUID -ne 0 ]; then
  echo "Must be ran as root"
  exit 255
fi

if [ $# -lt 1 ]; then
  echo "Need tap number as argument"
  exit 255
fi

TAP="tap$1"
NET="network$1"
MAC="52:55:00:d1:56:0$1"

bash setup-tap.sh start $TAP

qemu-system-x86_64 -m 1G \
  -nographic -serial mon:stdio \
  -device e1000,netdev=$NET,mac=$MAC \
  -netdev tap,id=$NET,ifname=$TAP,script=no,downscript=no \
  hdd.qcow

bash setup-tap.sh stop $TAP
