#!/usr/bin/env bash
set -e

CPATH=$(pwd)
cd $CPATH/sys-base
docker build -t pytnru/sys-base .

cd $CPATH/sys-base-mesos
docker build -t pytnru/sys-base-mesos .

cd $CPATH/sys-marathon
docker build -t pytnru/sys-marathon .

cd $CPATH/sys-mesos
docker build -t pytnru/sys-mesos .

cd $CPATH/sys-mesos-slave
docker build -t pytnru/sys-mesos-slave .

cd $CPATH/sys-zk
docker build -t pytnru/sys-zk .

cd $CPATH

echo "Done"