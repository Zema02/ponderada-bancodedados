# Documentação do Modelo de Banco de Dados

## Introdução

Este documento apresenta a modelagem de um banco de dados relacional do projeto para a Parceiros Voluntários. A modelagem foi realizada utilizando o SQL Designer e inclui os arquivos da modelagem (.xml e .sql), além de uma explicação detalhada das tabelas, relacionamentos, chaves primárias e estrangeiras.

## Estrutura do Banco de Dados

O banco de dados é composto por várias tabelas que armazenam informações relacionadas a usuários, projetos, convites, empresas, entre outras entidades envolvidas no sistema.

### Tabela: Perfil_usuario

A tabela `Perfil_usuario` armazena informações sobre os usuários.

| Coluna           | Tipo        | Descrição                                     |
|------------------|-------------|-----------------------------------------------|
| idUsuario        | INTEGER     | Identificador único do usuário (PK)           |
| nome             | VARCHAR(50) | Nome do usuário                               |
| data_nascimento  | DATE        | Data de nascimento do usuário                 |
| genero           | VARCHAR(50) | Gênero do usuário                             |
| email            | VARCHAR(50) | Email do usuário                              |
| senha            | VARCHAR(100)| Senha do usuário                              |
| cidade           | VARCHAR(50) | Cidade do usuário                             |
| estado           | VARCHAR(50) | Estado do usuário                             |
| horasTotais      | DECIMAL     | Total de horas trabalhadas                    |
| dataCriacao      | DATE        | Data de criação do perfil                     |

**Chave Primária:** `idUsuario`

### Tabela: Projeto

A tabela `Projeto` armazena informações sobre os projetos.

| Coluna           | Tipo        | Descrição                                      |
|------------------|-------------|------------------------------------------------|
| idProjeto        | INTEGER     | Identificador único do projeto (PK)            |
| nome             | VARCHAR(50) | Nome do projeto                                |
| descricao        | VARCHAR(200)| Descrição do projeto                           |
| cidade           | VARCHAR(50) | Cidade do projeto                              |
| estado           | VARCHAR(50) | Estado do projeto                              |
| numeroVagas      | INTEGER     | Número de vagas disponíveis                    |
| dataCriacao      | DATE        | Data de criação do projeto                     |
| isOng            | BINARY      | Indica se o projeto é de uma ONG               |
| cnpj             | VARCHAR(20) | CNPJ da ONG (se aplicável)                     |
| nomeOng          | VARCHAR(50) | Nome da ONG (se aplicável)                     |
| emailOng         | VARCHAR(50) | Email da ONG (se aplicável)                    |
| cep              | VARCHAR(20) | CEP da ONG (se aplicável)                      |
| bairro           | VARCHAR(50) | Bairro da ONG (se aplicável)                   |
| linkImg          | VARCHAR(300)| Link para imagem relacionada ao projeto        |

**Chave Primária:** `idProjeto`

### Tabela: Convite

A tabela `Convite` armazena informações sobre os convites enviados e recebidos por usuários.

| Coluna                | Tipo        | Descrição                                      |
|-----------------------|-------------|------------------------------------------------|
| idConvite             | INTEGER     | Identificador único do convite (PK)            |
| idUsuario (remetente) | INTEGER     | Identificador do usuário remetente (FK)        |
| idUsuario (destinatario) | INTEGER  | Identificador do usuário destinatário (FK)     |
| idProjeto             | INTEGER     | Identificador do projeto (FK)                  |
| descricao             | VARCHAR(200)| Descrição do convite                           |
| dataCriacao           | DATE        | Data de criação do convite                     |
| status                | VARCHAR(50) | Status do convite                              |

**Chave Primária:** `idConvite`

**Chaves Estrangeiras:**
- `idUsuario (remetente)` referencia `Perfil_usuario(idUsuario)`
- `idUsuario (destinatario)` referencia `Perfil_usuario(idUsuario)`
- `idProjeto` referencia `Projeto(idProjeto)`

### Tabela: Perfil_empresa

A tabela `Perfil_empresa` armazena informações sobre as empresas.

| Coluna           | Tipo        | Descrição                                      |
|------------------|-------------|------------------------------------------------|
| idPerfil_empresa | INTEGER     | Identificador único da empresa (PK)            |
| nome             | VARCHAR(50) | Nome da empresa                                |
| cnpj             | INTEGER     | CNPJ da empresa                                |
| cidade           | VARCHAR(50) | Cidade da empresa                              |
| estado           | INTEGER     | Estado da empresa                              |
| dataCriacao      | DATE        | Data de criação do perfil                      |
| telefone         | VARCHAR(11) | Telefone da empresa                            |
| atuacao          | VARCHAR(50) | Área de atuação da empresa                     |

**Chave Primária:** `idPerfil_empresa`

### Tabela: Usuarios_Empresa

A tabela `Usuarios_Empresa` armazena informações sobre a relação entre usuários e empresas.

| Coluna           | Tipo        | Descrição                                      |
|------------------|-------------|------------------------------------------------|
| idPerfil_empresa | INTEGER     | Identificador da empresa (FK)                  |
| idUsuario        | INTEGER     | Identificador do usuário (FK)                  |
| cargo            | VARCHAR(50) | Cargo do usuário na empresa                    |
| horasContadas    | DECIMAL     | Horas contadas para o usuário na empresa       |
| dataEntrada      | DATE        | Data de entrada do usuário na empresa          |

**Chaves Estrangeiras:**
- `idPerfil_empresa` referencia `Perfil_empresa(idPerfil_empresa)`
- `idUsuario` referencia `Perfil_usuario(idUsuario)`

### Tabela: Empresa_Projeto

A tabela `Empresa_Projeto` armazena informações sobre a relação entre empresas e projetos.

| Coluna           | Tipo        | Descrição                                      |
|------------------|-------------|------------------------------------------------|
| idPerfil_empresa | INTEGER     | Identificador da empresa (FK)                  |
| idProjeto        | INTEGER     | Identificador do projeto (FK)                  |
| area             | VARCHAR(50) | Área de atuação da empresa no projeto          |
| horasContadas    | DECIMAL     | Horas contadas para a empresa no projeto       |
| dataCriacao      | DATE        | Data de criação da relação                     |

**Chaves Estrangeiras:**
- `idPerfil_empresa` referencia `Perfil_empresa(idPerfil_empresa)`
- `idProjeto` referencia `Projeto(idProjeto)`

### Tabela: Usuarios_Projeto

A tabela `Usuarios_Projeto` armazena informações sobre a relação entre usuários e projetos.

| Coluna           | Tipo        | Descrição                                      |
|------------------|-------------|------------------------------------------------|
| idUsuario        | INTEGER     | Identificador do usuário (FK)                  |
| idProjeto        | INTEGER     | Identificador do projeto (FK)                  |
| funcao           | VARCHAR(50) | Função do usuário no projeto                   |
| horasContadas    | DECIMAL     | Horas contadas para o usuário no projeto       |
| dataEntrada      | DATE        | Data de entrada do usuário no projeto          |

**Chaves Estrangeiras:**
- `idUsuario` referencia `Perfil_usuario(idUsuario)`
- `idProjeto` referencia `Projeto(idProjeto)`

### Tabela: Voluntariado

A tabela `Voluntariado` armazena informações sobre os voluntariados.

| Coluna           | Tipo        | Descrição                                      |
|------------------|-------------|------------------------------------------------|
| idVoluntariado   | INTEGER     | Identificador único do voluntariado (PK)       |
| idUsuario        | INTEGER     | Identificador do usuário (FK)                  |
| titulo           | VARCHAR(50) | Título do voluntariado                         |
| descricao        | VARCHAR(200)| Descrição do voluntariado                      |
| horasTrabalhadas | DECIMAL     | Horas trabalhadas no voluntariado              |
| status           | VARCHAR(50) | Status do voluntariado                         |
| dataInicio       | DATE        | Data de início do voluntariado                 |
| dataFim          | DATE        | Data de término do voluntariado                |

**Chaves Estrangeiras:**
- `idUsuario` referencia `Perfil_usuario(idUsuario)`

## Relacionamentos

- A tabela `Perfil_usuario` possui relacionamentos com `Convite`, `Usuarios_Empresa`, `Usuarios_Projeto`, e `Voluntariado`.
- A tabela `Projeto` possui relacionamentos com `Convite`, `Empresa_Projeto`, e `Usuarios_Projeto`.
- A tabela `Convite` relaciona usuários e projetos.
- A tabela `Perfil_empresa` possui relacionamentos com `Usuarios_Empresa` e `Empresa_Projeto`.

## Exemplos de Consultas SQL

Abaixo estão exemplos de consultas SQL para interagir com o banco de dados:

#### Inserir uma nova instituição

```sql
INSERT INTO Perfil_empresa (nome, cnpj, cidade, estado, dataCriacao, telefone, atuacao) 
VALUES ('Nome da Empresa', 12345678901234, 'Cidade Exemplo', 'Estado Exemplo', '2024-06-17', '11987654321', 'Educação');

Inserir um novo usuário   
INSERT INTO Perfil_usuario (nome, data_nascimento, genero, email, senha, cidade, estado, horasTotais, dataCriacao) 
VALUES ('Nome do Usuário', '1990-01-01', 'Masculino', 'usuario@exemplo.com', 'hashsenha', 'Cidade Exemplo', 'Estado Exemplo', 0, '2024-06-17');
