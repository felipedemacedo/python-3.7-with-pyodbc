# Python 3.7.4 + pyodbc (SQL Server)

*Docker environment* with Python 3.7 and pyodbc dependencies installed for connection with SQL Server database.

## Dockerize your Python app using this environment

### Create this Dockerfile (inside your Python app main directory)
```java
FROM felipederodrigues/python37withpyodbc:v1

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN python -m pip install -r requirements.txt

ENTRYPOINT [ "python", "Main.py" ]
```
### Create a Docker image with it. This image will have your app inside it (e.g.: /app directory).
```java
docker build -t the-name-of-your-image:latest .
```
### Run your app: 
```java
docker run the-name-of-your-image:latest
```

## Suggestion
As a good practice, you can feed your app with environment variables for database connection.
For instance, you may call your application like this:
```java
docker run \
    -e SQL_SERVER_SERVER="hostname.your.network" \
    -e SQL_SERVER_DATABASE="YourDatabaseName" \
    -e SQL_SERVER_USERNAME="YourDatabaseUsername" \
    -e SQL_SERVER_PASSWORD="YourDatabasePassword" \
    the-name-of-your-image:latest
```
And the code may pick this information up, without hardcoding credentials.
```python
@staticmethod
def connect_db():
    """        
    Parameters
    ----------
    """

    print("Conecting to database ...")
    server = os.environ['SQL_SERVER_SERVER']
    database = os.environ['SQL_SERVER_DATABASE']
    username = os.environ['SQL_SERVER_USERNAME']
    password = os.environ['SQL_SERVER_PASSWORD']
    return db.DBConnection(server, database, username, password)
```

## Environment Info
```
root@84e7f4ffff9e:/# python --version
Python 3.7.4
root@84e7f4ffff9e:/# odbcinst -j
unixODBC 2.3.4
DRIVERS............: /etc/odbcinst.ini
SYSTEM DATA SOURCES: /etc/odbc.ini
FILE DATA SOURCES..: /etc/ODBCDataSources
USER DATA SOURCES..: /root/.odbc.ini
SQLULEN Size.......: 8
SQLLEN Size........: 8
SQLSETPOSIROW Size.: 8
root@84e7f4ffff9e:/# uname -r
4.9.125-linuxkit
root@84e7f4ffff9e:/# pip --version
pip 19.2.3 from /usr/local/lib/python3.7/site-packages/pip (python 3.7)
```

## Special Thanks:
- [@iuryxavier](https://github.com/iuryxavier)

## Credits:
- https://github.com/mkleehammer/pyodbc/wiki
