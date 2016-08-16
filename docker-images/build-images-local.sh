#!/usr/bin/env bash
set -e

source ../conf/source.global

function mkDockerfile {
  rm -f Dockerfile
  rm -f Dockerfile.bak
  cp Dockerfile.tmpl Dockerfile
  sed -i.bak "s/__sys_dkr_repo_name/$sys_dkr_repo_name/g" Dockerfile
  sed -i.bak "s/__sys_dkr_ver_tag/$sys_dkr_ver_tag/g" Dockerfile
  sed -i.bak "s/__debian_version/$debian_version/g" Dockerfile
  sed -i.bak "s/__mesos_version/$mesos_version/g" Dockerfile
  sed -i.bak "s/__java_version/$java_version/g" Dockerfile
  sed -i.bak "s/__spark_version/$spark_version/g" Dockerfile
  rm -f Dockerfile.bak
}


CPATH=$(pwd)

for each in sys-base sys-base-mesos sys-marathon sys-mesos sys-mesos-slave sys-zk ; do
	cd $CPATH/$each
	mkDockerfile
	docker build -t $sys_dkr_repo_name/$each:$sys_dkr_ver_tag .
	cd $CPATH
done

echo "Done"