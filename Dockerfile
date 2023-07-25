FROM centos:latest

# install bash, iproute, iputils и curl
RUN yum update -y && yum install -y bash iproute iputils curl

# install GitLab Runner
RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | bash && \ yum install -y gitlab-runner

# install tfswitch
RUN curl -L https://github.com/warrensbox/terraform-switcher/releases/download/0.10.0/terraform-switcher_0.10.0_linux_amd64.tar.gz | tar xvz && \
    mv terraform-switcher_0.10.0_linux_amd64/terraform-switcher /usr/local/bin/terraform-switcher && \
    chmod +x /usr/local/bin/terraform-switcher && \
    /usr/local/bin/terraform-switcher 0.14.10

# install Google Cloud SDK (gcloud) 
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz && \
    tar zxvf google-cloud-sdk.tar.gz && \
    ./google-cloud-sdk/install.sh -q && \
    rm -rf google-cloud-sdk.tar.gz google-cloud-sdk

# install packeges for net-tools
RUN yum install -y iputils net-tools

# change shell into bash
RUN sed -i 's|shell = ""|shell = "bash"|g' /etc/gitlab-runner/config.toml

# Run GitLab Runner
CMD ["gitlab-runner", "run"]
