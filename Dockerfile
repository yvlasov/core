FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y wget curl vim software-properties-common python-setuptools libffi-dev libssl-dev python-dev openssh-server python-pip ruby ruby-dev build-essential
RUN pip install requests[security] pyopenssl ndg-httpsclient pyasn1 mock six dopy "ansible>=2.1"
RUN wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb && dpkg -i vagrant_1.8.1_x86_64.deb && rm -f vagrant_1.8.1_x86_64.deb
RUN vagrant plugin install aws vagrant-aws digital_ocean vagrant-digitalocean vagrant-managed-servers

# Patch ssh connection in ansible, it couldn't work with ansible.
#RUN sed -i -- 's/$HOME\/.ansible\/cp/\/tmp/g' /usr/local/lib/python2.7/dist-packages/ansible/plugins/connection/ssh.py

ADD . /sys
RUN rm -rf /sys/conf ; rm -rf /sys/.vagrant ; rm -rf /sys/.git
RUN echo "while true; do echo 'running..'; sleep 60; done" > /run.sh
RUN chmod +x /run.sh

CMD /run.sh
