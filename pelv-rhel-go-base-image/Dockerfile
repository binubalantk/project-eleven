FROM registry.access.redhat.com/ubi8/ubi:latest as base_mage

# Install Node.js and npm
RUN yum install -y \
    wget \
    tar \
    curl \
    && yum clean all

# Download and install Oracle Java 22 LTS
RUN curl -fsSL -o /tmp/jdk-22_linux-x64_bin.tar.gz https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.tar.gz \
&& tar -C /usr/local -xzf /tmp/jdk-22_linux-x64_bin.tar.gz \
&& rm /tmp/jdk-22_linux-x64_bin.tar.gz \
&& ln -s /usr/local/jdk-22/bin/java /usr/bin/java \
&& ln -s /usr/local/jdk-22/bin/javac /usr/bin/javac

# Install Node.js and npm from NodeSource repository
# Use NodeSource to get the latest Node.js version
RUN curl -fsSL https://rpm.nodesource.com/setup_current.x | bash - \
    && yum install -y nodejs \
    && yum clean all

# Install the OpenAPI Generator CLI globally using npm
RUN npm install -g @openapitools/openapi-generator-cli

# Download and install Go 1.23.0
RUN wget https://go.dev/dl/go1.23.0.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz \
    && rm go1.23.0.linux-amd64.tar.gz

# Set Go environment variables
ENV GO111MODULE=on \
    GOPATH=/go \
    PATH=$GOPATH/bin:/usr/local/go/bin:$PATH