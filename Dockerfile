FROM rundeck/rundeck:3.0.12
LABEL maintainer="Josh Cherry"

# Install Ansible.
RUN sudo apt-get update && \
    sudo apt-get install --no-install-recommends -y \
      python3-pip \
      sshpass \
  && sudo pip3 install --upgrade setuptools pip \
  && sudo pip install --upgrade pyyaml ansible=="2.7.*" \
  && sudo apt-get remove -y python3-pip \
  && sudo rm -rf /var/lib/apt/lists/* \
  && sudo rm -Rf /usr/share/doc && sudo rm -Rf /usr/share/man \
  && sudo apt-get clean
