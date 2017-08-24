FROM jenkins/jenkins:lts

# if we want to install via apt
USER root
RUN apt-get update && apt-get -y install python-setuptools python-dev build-essential
RUN easy_install pip && pip install --upgrade virtualenv

# drop back to the regular jenkins user - good practice
USER jenkins
