--------------------------1ªResolução----------------------------

CREATE DATABASE Datawarehouse;

GO
CREATE SCHEMA info;

GO
CREATE TABLE info.Clientes (
    ClienteID INT NOT NULL,
    PRIMARY KEY (ClienteID)
)
GO
CREATE TABLE info.Pedidos (
    ClienteID INT NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES info.Clientes(ClienteID)
)

GO
CREATE TABLE info.Departamentos (
    DepartamentoID INT NOT NULL,
    PRIMARY KEY (DepartamentoID)
)
GO
CREATE TABLE info.Funcionarios (
    FuncionarioID INT NOT NULL,
    DepartamentoID INT NOT NULL,
    PRIMARY KEY (FuncionarioID),
    FOREIGN KEY (DepartamentoID) REFERENCES info.Departamentos(DepartamentoID)
)

GO
CREATE TABLE info.Cursos (
    CursoID INT NOT NULL,
    PRIMARY KEY (CursoID)
)
GO
CREATE TABLE info.Matriculas (
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    FOREIGN KEY (CursoID) REFERENCES info.Cursos(CursoID)
)

GO
CREATE TABLE info.Fornecedores (
    FornecedoresID INT NOT NULL,
    PRIMARY KEY (FornecedoresID)
)
GO
CREATE TABLE info.Produtos (
    ProdutoID INT NOT NULL,
    FornecedoresID INT NOT NULL,
    PRIMARY KEY (ProdutoID),
    FOREIGN KEY (FornecedoresID) REFERENCES info.Fornecedores(FornecedoresID)
)

GO
CREATE TABLE info.Projetos (
    ProjetoID INT NOT NULL,
    PRIMARY KEY (ProjetoID)
)
GO
CREATE TABLE info.Tarefas (
    TarefaID INT NOT NULL,
    ProjetoID INT NOT NULL,
    PRIMARY KEY (TarefaID),
    FOREIGN KEY (ProjetoID) REFERENCES info.Projetos(ProjetoID)
)

--------------------------2ªResolução----------------------------

GO
CREATE DATABASE Datawarehouse

GO
CREATE SCHEMA info2

---------------------------Exercício 1: Tabela de Clientes e Pedidos---------------------------
--Crie uma tabela Clientes com ClienteID como Primary Key. 
--Crie uma tabela Pedidos que possui um campo ClienteID como Foreign Key, ligando cada pedido a um cliente específico.

GO
CREATE TABLE Clientes(
    ClienteID INT NOT NULL,
    PRIMARY KEY(ClienteID)
)

GO
CREATE TABLE Pedidos(
    PedidoID INT NOT NULL,
    ClienteID INT NOT NULL,
    PRIMARY KEY(PedidoID),
    FOREIGN KEY(ClienteID) REFERENCES Clientes(ClienteID)
)

---------------------------Exercício 2: Tabela de Departamentos e Funcionários---------------------------
--Crie uma tabela Departamentos com DepartamentoID como Primary Key. 
--Crie uma tabela Funcionarios com FuncionarioID como Primary Key e DepartamentoID como Foreign Key, associando cada funcionário ao seu departamento.

GO
CREATE TABLE Departamentos(
    DepartamentoID INT,
    PRIMARY KEY(DepartamentoID)
)

GO
CREATE TABLE Funcionarios(
    FuncionarioID INT,
    DepartamentoID INT,
    PRIMARY KEY(FuncionarioID),
    FOREIGN KEY(DepartamentoID) REFERENCES Departamentos(DepartamentoID)
)

---------------------------Exercício 3: Tabela de Cursos e Alunos---------------------------
--Crie uma tabela Cursos com CursoID como Primary Key. 
--Em seguida, crie uma tabela Matriculas que armazena AlunoID e CursoID, onde CursoID é uma Foreign Key que referencia a tabela Cursos.

GO
CREATE TABLE Cursos(
    CursoID INT,
    PRIMARY KEY(CursoID)
)

GO
CREATE TABLE Matriculas(
    AlunoID INT,
    CursoID INT,
    PRIMARY KEY(AlunoID),
    FOREIGN KEY(CursoID) REFERENCES Cursos(CursoID)
)
