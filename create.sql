CREATE TABLE "Users" (
    "UsersID" uuid   NOT NULL,
    "Firstname" string   NOT NULL,
    "Lastname" string   NOT NULL,
    "Birthday" date   NOT NULL,
    "Email" string   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "UsersID"
     )
);

CREATE TABLE "Roles" (
    "RolesID" uuid   NOT NULL,
    "UsersID" uuid   NOT NULL,
    "Level" int   NOT NULL,
    CONSTRAINT "pk_Roles" PRIMARY KEY (
        "RolesID"
     )
);

ALTER TABLE "Roles" ADD CONSTRAINT "fk_Roles_UsersID" FOREIGN KEY("UsersID")
REFERENCES "Users" ("UsersID");

CREATE INDEX "idx_Users_Firstname"
ON "Users" ("Firstname");
