CREATE TABLE "Livro" (
  "isbn" SERIAL PRIMARY KEY NOT NULL,
  "autor" varchar(255),
  "quantidade" integer,
  "assunto" varchar(255),
  "codigo_editora" integer
);

CREATE TABLE "Editora" (
  "codigo" SERIAL PRIMARY KEY NOT NULL,
  "nome_gerente" varchar(255),
  "telefone" varchar(255),
  "endereco" varchar(255)
);

CREATE TABLE "Cliente" (
  "ident" SERIAL PRIMARY KEY NOT NULL,
  "endereco" varchar(255),
  "telefone" varchar(255),
  "ftipo" boolean,
  "cpf" varchar UNIQUE,
  "cnpj" varchar UNIQUE
);

CREATE TABLE "Compra" (
  "isbn" integer NOT NULL,
  "ident" integer NOT NULL,
  "quantidade" integer,
  "data_compra" timestamp DEFAULT (now())
);

ALTER TABLE "Livro" ADD FOREIGN KEY ("codigo_editora") REFERENCES "Editora" ("codigo");

ALTER TABLE "Compra" ADD FOREIGN KEY ("isbn") REFERENCES "Livro" ("isbn");

ALTER TABLE "Compra" ADD FOREIGN KEY ("ident") REFERENCES "Cliente" ("ident");
