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
