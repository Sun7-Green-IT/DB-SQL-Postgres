# DB-SQL-Postgres

## Development with Docker

Start docker container(s) :

```Shell Session
$ make start
```

Stop docker container(s) :

```Shell Session
$ make stop
```

Need help with `make` ?

```Shell Session
$ make help
```

**Access database with thick client**

```bash
Host: localhost
Database: green_it
Port: 5432
User: green_it
Password: p@ssword
```

**Access database with Adminer**
Uncoment adminer service in docker-compose.yml and start containers.

```bash
Server: db
User: green_it
Password: p@ssword
Database: green_it
```

### Table creation

```SQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    UsersID uuid DEFAULT uuid_generate_v4 (),
    Firstname varchar(25)  NOT NULL,
    Lastname varchar(25)   NOT NULL,
    Birthday date   NOT NULL,
    email varchar(50)  NOT NULL,
    RolesID int NOT NULL,
    PRIMARY KEY (UsersID),
    FOREIGN KEY (RolesID) REFERENCES roles(RolesID)
);

CREATE TABLE roles (
    RolesID int NOT NULL,
    Role varchar(25)  NOT NULL,
    PRIMARY KEY (RolesID)
);

CREATE INDEX "idx_Users_Firstname"
ON users ("email");
```
