FROM --platform=$BUILDPLATFORM ubuntu:jammy
ARG GOVERSION
WORKDIR /tmp
RUN apt update -y && apt install openssh-server git redis-tools curl pip -y
RUN MARCH=$(uname -m) wget https://go.dev/dl/go${GOVERSION}.linux-$(if [ $MARCH="$BUILDPLATFORM" ]; then echo "amd64"; fi).tar.gz
RUN rm -rf /usr/local/go && MARCH=$(uname -m) tar -C /usr/local -xzf go${GOVERSION}.linux-$(if [ $MARCH="$BUILDPLATFORM" ]; then echo "amd64"; fi).tar.gz
RUN echo "export PATH=\$PATH:/usr/local/go/bin" > /etc/profile.d/go.sh
