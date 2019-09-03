# https://stackoverflow.com/questions/55053583/python3-7-stretch-unixodbc-conflicts-unixodbc-bin
FROM python:3.7-stretch

# Get the ODBC driver for Microsoft SQL Server
RUN apt-get update \
&& apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
&& curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
&& curl https://packages.microsoft.com/config/debian/9/prod.list  > /etc/apt/sources.list.d/mssql-release.list \
&& apt-get update \
&& ACCEPT_EULA=Y apt-get -y install --no-install-recommends msodbcsql17=17.2.0.1-1 \
    unixodbc=2.3.4-1 \
    unixodbc-bin=2.3.0-4+b1 \
    unixodbc-dev=2.3.4-1 \
    libodbc1=2.3.4-1 \
    odbcinst1debian2=2.3.4-1 \
    odbcinst=2.3.4-1 \
&& apt-get clean

CMD ["bash"]
