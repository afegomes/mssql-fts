FROM ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y curl gnupg2 apt-transport-https \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list | tee /etc/apt/sources.list.d/mssql-server.list \
    && apt-get update \
    && apt-get install -y mssql-server \
    && apt-get install -y mssql-server-fts \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

CMD /opt/mssql/bin/sqlservr
