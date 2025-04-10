# SuiteCloud Java CLI Docker Image

FROM node:lts-alpine

# Install base pipeline dependencies ()
RUN apk add --no-cache xmlstarlet wget openjdk17-jre-headless

# Install SDF CLI for Java
RUN mkdir -p /opt/sdf/sdk/
RUN wget https://system.netsuite.com/download/suitecloud-sdk/cli/java/latest/sdf-cli.tar.gz -P /opt/sdf/sdk/
RUN tar xvzf /opt/sdf/sdk/sdf-cli.tar.gz -C /opt/sdf/sdk
RUN chmod +x /opt/sdf/sdk/sdfcli
RUN rm /opt/sdf/sdk/sdf-cli.tar.gz
RUN export PATH=$PATH:/opt/sdf/sdk
RUN cd ~

LABEL "com.azure.dev.pipelines.agent.handler.node.path"="/usr/bin/node"
CMD [ "bash" ]
