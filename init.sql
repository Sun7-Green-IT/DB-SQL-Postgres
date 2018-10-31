CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE roles (
    RolesID int NOT NULL,
    Role varchar(25)  NOT NULL,
    PRIMARY KEY (RolesID)
);

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

CREATE INDEX "idx_Users_Firstname"
ON users ("email");