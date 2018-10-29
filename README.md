# DB-SQL-Postgres



### Creation des tables

```
CREATE TABLE "Users" (
    "UsersID" uuid   NOT NULL,
    "Firstname" string   NOT NULL,
    "Lastname" string   NOT NULL,
    "Birthday" date   NOT NULL,
    "Email" string   NOT NULL,
    "RolesID" int NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "UsersID"
     )
);

CREATE TABLE "Roles" (
    "RolesID" int   NOT NULL,
    "Role" text   NOT NULL,
    CONSTRAINT "pk_Roles" PRIMARY KEY (
        "RolesID"
     )
);

ALTER TABLE "Users" ADD CONSTRAINT "fk_Roles_UsersID" FOREIGN KEY("RolesID")
REFERENCES "Roles" ("RolesID");

CREATE INDEX "idx_Users_Firstname"
ON "Users" ("Email");
```
