-- Práticas
CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

SELECT * FROM users;

CREATE TABLE phone (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

SELECT * FROM phone;

INSERT INTO users (id,name,email,password)
VALUES("u001","Daniel","daniel@teste.com","123456"),
("u002","Carlos","carlos@teste.com", "654321");


INSERT INTO phone (id, phone_number, user_id)
VALUES ("p001", "119999-9898", "u001"),
("p002", "119999-9897", "u001"),
("p003", "119999-9896", "u002");

SELECT * FROM users
INNER JOIN phone
ON phone.user_id = users.id;

CREATE TABLE licenses(
    id TEXT PRIMARY KEY NOT NULL UNIQUE,
    register_number TEXT NOT NULL UNIQUE,
    category TEXT NOT NULL
);

CREATE TABLE  drivers (
    id TEXT PRIMARY KEY NOT NULL UNIQUE,
    name TEXT NOT NULL, 
    email TEXT NOT NULL, 
    password TEXT NOT NULL, 
    license_id TEXT NOT NULL UNIQUE,
    FOREIGN KEY (license_id) REFERENCES licenses (id)
);

INSERT INTO licenses (id, register_number,category)
VALUES ("l001","1112","B"),
("l002","1122","C"),
("l003","1222","B");

INSERT INTO drivers (id, name, email, password,license_id)
VALUES ("d001","Daniel","daniel@teste.com","123456","l001"),
("d002","Cassia","cassia@teste.com","123456","l002"),
("d003","Cristiano","cristiano@teste.com","123456","l003");

SELECT * FROM licenses
INNER JOIN drivers
ON drivers.license_id = licenses.id;

CREATE TABLE usuario (
id TEXT PRIMARY KEY UNIQUE NOT NULL, 
nome TEXT NOT NULL, 
email TEXT NOT NULL);

INSERT INTO usuario (id, nome, email)
VALUES ("u001", "Daniel","daniel@teste.com"),
("u002", "Cassia","cassia@teste.com"),
("u003", "Cristiano","cristiano@teste.com");

CREATE TABLE documento (
    id TEXT PRIMARY KEY NOT NULL UNIQUE,
    numero INTEGER NOT NULL UNIQUE, 
    usuario_id TEXT NOT NULL UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

INSERT INTO documento (id, numero, usuario_id)
VALUES ("d001", 123456, "u001"),
("d002", 123457, "u002"),
("d003", 123458, "u003");

SELECT * FROM usuario
INNER JOIN documento
ON documento.usuario_id = usuario.id;


CREATE TABLE turma (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL 
);

CREATE TABLE aluno (
id TEXT PRIMARY KEY UNIQUE NOT NULL,
name TEXT NOT NULL,
turma_id TEXT NOT NULL,
FOREIGN KEY (turma_id) REFERENCES turma (id));

INSERT INTO turma (id, name) 
VALUES("t001", "AMMAL");

INSERT INTO aluno (id, name, turma_id) 
VALUES("a001", "Daniel", "t001" ),
("a002", "Cassia", "t001"),
("a003", "Cristiano", "t001");

SELECT * FROM aluno
INNER JOIN turma
ON turma.id = aluno.turma_id;