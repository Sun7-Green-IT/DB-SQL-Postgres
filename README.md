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

Starting containers will automatically create tables.

```SQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "role" (
    role_id uuid DEFAULT uuid_generate_v4 (),
    name varchar(25)  NOT NULL,
    createdAt date NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (role_id)
);

CREATE TABLE "user" (
    user_id uuid DEFAULT uuid_generate_v4 (),
    firstname varchar(25)  NOT NULL,
    lastname varchar(25)   NOT NULL,
    birthday date   NOT NULL,
    email varchar(50)  NOT NULL,
    role_id uuid NOT NULL,
    createdAt date NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (user_id),
    FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE INDEX "idx_user_email"
ON user ("email");
```
