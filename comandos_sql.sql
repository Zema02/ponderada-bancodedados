-- ---
-- Table 'Perfil_usuario'
-- ---

CREATE TABLE IF NOT EXISTS "Perfil_usuario" (
  "idUsuario" SERIAL PRIMARY KEY,
  "nome" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "data_nascimento" DATE NOT NULL,
  "genero" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "email" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "senha" VARCHAR(100) NOT NULL DEFAULT 'NULL',
  "cidade" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "estado" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "horasTotais" DECIMAL NOT NULL DEFAULT NULL,
  "dataCriacao" DATE NOT NULL DEFAULT CURRENT_DATE
);

-- ---
-- Table 'Projeto'
-- ---

CREATE TABLE "Projeto" (
  "PK idProjeto" serial,
  "nome" varchar(50),
  "descrição" varchar(200),
  "dataCriação" date,
  "região" varchar(50),
  "cidade" varchar(50),
  "estado" varchar(50),
  "bairro" varchar(50),
  "país" varchar(50),
  "numeroVagas" int,
  "cep" varchar(20),
  "isOng" bool,
  "nomeOng" varchar(20),
  "emailOng" varchar(50),
  "cnpj" varchar(20),
  "linkImg" varchar(200)
);


-- ---
-- Table 'Convite'
-- ---

CREATE TABLE IF NOT EXISTS "Convite" (
  "idConvite" SERIAL PRIMARY KEY,
  "idUsuario_remetente" INTEGER NOT NULL,
  "idUsuario_destinatario" INTEGER NOT NULL,
  "idProjeto" INTEGER NOT NULL,
  "descricao" VARCHAR(200) NOT NULL DEFAULT 'NULL',
  "dataCriacao" DATE NOT NULL DEFAULT CURRENT_DATE,
  "status" VARCHAR(50)
);

-- ---
-- Table 'Perfil_empresa'
-- ---

CREATE TABLE IF NOT EXISTS "Perfil_empresa" (
  "idPerfil_empresa" SERIAL PRIMARY KEY,
  "nome" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "cnpj" BIGINT NOT NULL,
  "cidade" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "estado" VARCHAR(50),
  "dataCriacao" DATE NOT NULL DEFAULT CURRENT_DATE,
  "telefone" VARCHAR(11) NOT NULL,
  "atuacao" VARCHAR(50) NOT NULL
);

-- ---
-- Table 'Usuarios_Empresa'
-- ---

CREATE TABLE IF NOT EXISTS "Usuarios_Empresa" (
  "idPerfil_empresa" INTEGER NOT NULL,
  "idUsuario" INTEGER NOT NULL,
  "cargo" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "horasContadas" DECIMAL NOT NULL DEFAULT NULL,
  "dataEntrada" DATE NOT NULL DEFAULT CURRENT_DATE,
  PRIMARY KEY ("idPerfil_empresa", "idUsuario")
);

-- ---
-- Table 'Empresa_Projeto'
-- ---

CREATE TABLE IF NOT EXISTS "Empresa_Projeto" (
  "idPerfil_empresa" INTEGER NOT NULL,
  "idProjeto" INTEGER NOT NULL,
  "area" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "horasContadas" DECIMAL,
  "dataCriacao" DATE NOT NULL DEFAULT CURRENT_DATE,
  PRIMARY KEY ("idPerfil_empresa", "idProjeto")
);

-- ---
-- Table 'Usuarios_Projeto'
-- ---

CREATE TABLE IF NOT EXISTS "Usuarios_Projeto" (
  "idUsuario" INTEGER NOT NULL,
  "idProjeto" INTEGER NOT NULL,
  "funcao" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "horasContadas" DECIMAL NOT NULL DEFAULT NULL,
  "dataEntrada" DATE NOT NULL DEFAULT CURRENT_DATE,
  PRIMARY KEY ("idUsuario", "idProjeto")
);

-- ---
-- Table 'Voluntariado'
-- ---

CREATE TABLE IF NOT EXISTS "Voluntariado" (
  "idVoluntariado" SERIAL PRIMARY KEY,
  "idUsuario" INTEGER NOT NULL,
  "titulo" VARCHAR(50) NOT NULL DEFAULT 'NULL',
  "descricao" VARCHAR(200),
  "horasTrabalhadas" DECIMAL NOT NULL DEFAULT NULL,
  "status" VARCHAR(50),
  "dataInicio" DATE NOT NULL DEFAULT CURRENT_DATE,
  "dataFim" DATE
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE "Convite" ADD FOREIGN KEY ("idUsuario_remetente") REFERENCES "Perfil_usuario" ("idUsuario");
ALTER TABLE "Convite" ADD FOREIGN KEY ("idUsuario_destinatario") REFERENCES "Perfil_usuario" ("idUsuario");
ALTER TABLE "Convite" ADD FOREIGN KEY ("idProjeto") REFERENCES "Projeto" ("idProjeto");
ALTER TABLE "Usuarios_Empresa" ADD FOREIGN KEY ("idPerfil_empresa") REFERENCES "Perfil_empresa" ("idPerfil_empresa");
ALTER TABLE "Usuarios_Empresa" ADD FOREIGN KEY ("idUsuario") REFERENCES "Perfil_usuario" ("idUsuario");
ALTER TABLE "Empresa_Projeto" ADD FOREIGN KEY ("idPerfil_empresa") REFERENCES "Perfil_empresa" ("idPerfil_empresa");
ALTER TABLE "Empresa_Projeto" ADD FOREIGN KEY ("idProjeto") REFERENCES "Projeto" ("idProjeto");
ALTER TABLE "Usuarios_Projeto" ADD FOREIGN KEY ("idUsuario") REFERENCES "Perfil_usuario" ("idUsuario");
ALTER TABLE "Usuarios_Projeto" ADD FOREIGN KEY ("idProjeto") REFERENCES "Projeto" ("idProjeto");
ALTER TABLE "Voluntariado" ADD FOREIGN KEY ("idUsuario") REFERENCES "Perfil_usuario" ("idUsuario");
