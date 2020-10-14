#!/bin/bash

NEWB=$1

mkdir $NEWB
cd $NEWB

ln -s ../base/hdd.qcow base.qcow
qemu-img create -f qcow2 -b base.qcow hdd.qcow

TTY=../base/serial.sh
GUI=../base/gui.sh
TAP=../base/serial-tap.sh
TAPSETUP=../base/setup-tap.sh
test -e $TTY && cp $TTY .
test -e $GUI && cp $GUI .
test -e $TAP && cp $TAP .
test -e $TAPSETUP && cp $TAPSETUP .
