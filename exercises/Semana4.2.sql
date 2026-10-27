
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