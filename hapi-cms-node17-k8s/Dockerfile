# forcing docker to use linux/amd64 platform by default on macOS
FROM --platform=linux/amd64 node:17.4-alpine

# indicate the author and the build date
LABEL maintainer="ecomdevops"
ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE

# create directory
WORKDIR /opt/app/

# install all dependencies
COPY bootstrap.sh ./source-code/ /opt/app/

# execute the permissions from user to group
RUN chmod -R g=u "/opt/app/"

# set executables that will run when the container is initiated
ENTRYPOINT ["sh", "/opt/app/bootstrap.sh"]