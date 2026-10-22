/*EXERCÍCIO 1*/
GO
CREATE DATABASE Datawarehouse

GO
CREATE SCHEMA info;

-----------------------------------------------------

/*EXERCÍCIO 2*/
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

-----------------------------------------------------

/*EXERCÍCIO 3*/
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

-----------------------------------------------------

/*EXERCÍCIO 4*/
