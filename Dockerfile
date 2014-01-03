FROM stackbrew/ubuntu:12.04
MAINTAINER Jay Faulkner "jay.faulkner@rackspace.com"

RUN apt-get update && apt-get -y install git lsb-release

RUN git clone http://github.com/openstack-dev/devstack && \
    cd devstack && \
    git checkout stable/havana

RUN ./devstack/tools/create-stack-user.sh

RUN chown -R stack:stack devstack

RUN cd devstack && sudo -u stack ./stack.sh
