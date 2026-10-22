/*EXERCÍCIO 1
GO
CREATE DATABASE Datawarehouse

USE Datawarehouse

GO
CREATE SCHEMA info;
*/

-----------------------------------------------------

/*EXERCÍCIO 2
GO
CREATE TABLE info.Clientes (
    ClienteID INT NOT NULL,
    PRIMARY KEY (ClienteID)
)

GO
CREATE TABLE info.Pedidos (
    EncomendaID INT NOT NULL,
    FOREIGN KEY (EncomendaID) REFERENCES info.Clientes(ClienteID)
)
*/

-----------------------------------------------------

/*EXERCÍCIO 3
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
*/

-----------------------------------------------------

/*EXERCÍCIO 4
GO
CREATE TABLE info.Cursos (
    CursoID INT NOT NULL,
    PRIMARY KEY (CursoID)
)

GO
CREATE TABLE info.Matriculas (
    AlunoID INT NOT NULL UNIQUE,
    CursoID INT NOT NULL,
    FOREIGN KEY (CursoID) REFERENCES info.Cursos(CursoID)
)
*/

-----------------------------------------------------

/*EXERCÍCIO 5*/
GO 
CREATE TABLE info.Fornecedores (
    FornecedorID INT NOT NULL,
    PRIMARY KEY (FornecedorID)
)

GO
CREATE TABLE info.Produtos (
    ProdutoID INT NOT NULL,
    FornecedorID INT NOT NULL,
    PRIMARY KEY (ProdutoID),
    FOREIGN KEY (FornecedorID) REFERENCES info.Fornecedores(FornecedorID)
)

-----------------------------------------------------

/*EXERCÍCIO 6*/
