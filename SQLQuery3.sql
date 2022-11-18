CREATE DATABASE dbBanco
GO

USE dbBanco
GO

--TABELAS SOLICITADAS
CREATE TABLE Contratos
(
	Contrato_Id INT PRIMARY KEY NOT NULL,
	Valor_Parcela INT NOT NULL,
	Parcelas INT NOT NULL
)
GO

CREATE TABLE Pessoas
(
	Id INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Contrato_Id INT FOREIGN KEY REFERENCES Contratos (Contrato_Id) NOT NULL,
	Inadimplente BIT NOT NULL,
	Dt_Completo VARCHAR (10)
)
GO

SET IDENTITY_INSERT Pessoas  ON 
GO

CREATE TABLE Pagamentos
(
	Id_Pagamento INT NOT NULL,
	Id INT FOREIGN KEY REFERENCES Pessoas (Id),
	Data_Pagamento VARCHAR (10) NOT NULL
)
GO

CREATE TABLE Pagamentos_Completos
(
	Id INT FOREIGN KEY REFERENCES Pessoas (Id) NOT NULL,
	Valor_Total INT NOT NULL
)

DELETE FROM Pagamentos_Completos
WHERE Id=4, Inadimplente = 'SIM'


--INSERINDO DADOS NO BANCO
INSERT INTO Contratos (Contrato_Id, Valor_Parcela, Parcelas) VALUES (2, 300, 48), (1, 150, 100), (3, 550, 24), (4, 1000, 12)

INSERT INTO Pessoas (Id, Nome, Contrato_Id, Inadimplente, Dt_Completo) VALUES (1, 'Cristian Ghyprievy', 2, 1, 'NULL'), (2, 'Joana Cabel', 1, 1, 'NULL'), (3, 'John Serial', 3, 1, 'NULL'), (4, 'Michael Seven', 2, 0, '2021-09-25')

INSERT INTO Pagamentos (Id_Pagamento, Id, Data_Pagamento) VALUES (1, 4, '2021-09-01'), (2, 3, '2021-09-05'), (3, 1, '2021-09-19'), (4, 2, '2021-09-25')

INSERT INTO Pagamentos_Completos (Id, Valor_Total) VALUES (4, 14400) 




--RESULTADO TABELA INADIMPLENCIA
SELECT Nome, Data_Pagamento, Valor_Parcela
FROM Pessoas, Pagamentos, Contratos
WHERE Inadimplente = 'SIM'
ORDER BY Nome, Data_Pagamento, Valor_Parcela

--RESULTADO TABELA PAGAMENTO COMPLETO
SELECT *
FROM Pagamentos_Completos
JOIN Pessoas
ON Pagamentos_Completos.Id = Pessoas.Id
WHERE Inadimplente = 'NAO'
ORDER BY Nome, Valor_Total








--UPDATE Pagamentos SET Data_Pagamento = '2021-09-25' WHERE Id_Pagamento = 4
--SELECT * FROM Pessoas
--SELECT * FROM Contratos
--Select * FROM Pagamentos