# SuiteCloud Java CLI Docker Image

FROM node:22.8-alpine3.20

# Install base dependencies
RUN apk add --no-cache bash openjdk17 xmlstarlet bash wget git yarn unzip 
RUN cd ~

# Install SDF CLI for Java
RUN wget  https://system.netsuite.com/download/suitecloud-sdk/cli/java/latest/sdf-cli.tar.gz -P /opt/sdf/sdk
RUN tar xvzf /opt/sdf/sdk/sdf-cli.tar.gz -C /opt/sdf/sdk
RUN chmod +x /opt/sdf/sdk/sdfcli
RUN rm /opt/sdf/sdk/sdf-cli.tar.gz
