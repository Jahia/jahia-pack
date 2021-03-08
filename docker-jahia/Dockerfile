ARG JAHIA_VERSION

FROM jahia/jahia-core:${JAHIA_VERSION}

ARG PACK_VERSION
ARG C_USER="tomcat"
ARG C_GROUP="tomcat"

LABEL maintainer="Jahia Product team <product@jahia.com>"

RUN mkdir -p /data/digital-factory-data/patches/provisioning
COPY target/dependency/jahia-core-modules-${PACK_VERSION}-provisioning.yaml /data/digital-factory-data/patches/provisioning/1.1-jahia-core-modules.yaml
COPY --chown=${C_USER}:${C_GROUP} target/repository /data/m2/repository/

#RUN downloadProvisioning.sh /data/digital-factory-data/patches/provisioning/*

