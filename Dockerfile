# SuiteCloud Java CLI Docker Image

FROM ubuntu:24.04

# Install base pipeline dependencies ()
RUN apt update && apt install -y xmlstarlet wget openjdk-17-jdk-headless nodejs

# Install SDF CLI for Java
RUN wget https://system.netsuite.com/download/suitecloud-sdk/cli/java/24.1/sdf-cli.tar.gz -P /opt/sdf/sdk
RUN tar xvzf /opt/sdf/sdk/sdf-cli.tar.gz -C /opt/sdf/sdk
RUN chmod +x /opt/sdf/sdk/sdfcli
RUN rm /opt/sdf/sdk/sdf-cli.tar.gz
RUN export PATH=$PATH:/opt/sdf/sdk
RUN cd ~

LABEL "com.azure.dev.pipelines.agent.handler.node.path"="/usr/bin/node"
CMD [ "bash" ]