FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y wget curl vim libffi-dev libssl-dev python-dev openssh-server python-pip ruby ruby-dev build-essential ssh-askpass screen
RUN pip install --upgrade pip
RUN pip install requests[security] pyopenssl ndg-httpsclient pyasn1 mock six dopy "ansible>=2.1"
RUN wget -q https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_x86_64.deb && dpkg -i vagrant_1.8.5_x86_64.deb && rm -f vagrant_1.8.5_x86_64.deb
RUN vagrant plugin install aws vagrant-aws digital_ocean vagrant-digitalocean vagrant-managed-servers
ADD . /sys
RUN rm -rf /sys/conf ; rm -rf /sys/.vagrant ; rm -rf /sys/.git
RUN echo "while true; do echo 'running...'; sleep 60; done" > /run.sh
RUN chmod +x /run.sh

CMD /run.sh
