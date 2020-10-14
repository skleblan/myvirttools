if [ $EUID != 0 ] ; then
  echo "Error: must be ran as root\n"
  exit 255
fi

if [ $# -lt 2 ] ; then
  echo "Error: expecting args CMD, TAP"
  exit 255
fi

CMD=$1
TAP=$2

if [[ $CMD = 'start' ]] ; then
  ip tuntap add dev $TAP mode tap user steven
  ip link set $TAP master br5
  ip link set $TAP up
elif [[ $CMD = 'stop' ]] ; then
  ip link set $TAP down 
  ip link set $TAP nomaster
  ip tuntap del dev $TAP mode tap 
fi
