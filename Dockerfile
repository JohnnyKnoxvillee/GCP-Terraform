FROM centos:latest

RUN yum update -y && yum install -y bash

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | bash && \ yum install -y gitlab-runner

RUN sed -i 's|shell = ""|shell = "bash"|g' /etc/gitlab-runner/config.toml

CMD ["gitlab-runner", "run"]
