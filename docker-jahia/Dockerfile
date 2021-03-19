ARG PARENT_TAG

FROM jahia/jahia-core:${PARENT_TAG}

ARG PROJECT_VERSION
ARG C_USER="tomcat"
ARG C_GROUP="tomcat"

LABEL maintainer="Jahia Product team <product@jahia.com>"

RUN mkdir -p /usr/local/tomcat/digital-factory-data/patches/provisioning
COPY target/dependency/jahia-core-modules-${PROJECT_VERSION}-provisioning.yaml /usr/local/tomcat/digital-factory-data/patches/provisioning/1.1-jahia-core-modules.yaml
RUN mkdir -p /home/${C_USER}/.m2/repository
COPY --chown=${C_USER}:${C_GROUP} target/repository /home/${C_USER}/.m2/repository
