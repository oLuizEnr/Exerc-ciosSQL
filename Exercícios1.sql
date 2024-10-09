USE ContosoRetailDW

-- Exerc�cio 1 a)
SELECT *
FROM DimProduct
-- Existem ainda 2517 produtos cadastrados


-- Exerc�cio 1 b)
SELECT *
FROM DimCustomer
-- Diminuiu, j� que n�o s� existem bem menas linhas como as chaves dos cliente sequer chegam a 19200


-- Exerc�cio 2 a)
SELECT CustomerKey, FirstName, EmailAddress, BirthDate
FROM DimCustomer
-- Selecionou as colunas que guardam a chave, nome, email e data de nascimento do consumidor


-- Exerc�cio 2 b)
SELECT CustomerKey AS "ChaveClient", FirstName AS "Nome", EmailAddress AS "Email", BirthDate AS "DDN"
FROM DimCustomer
-- Renomeado os atributos para portugu�s


-- Exerc�cio 3 a)
 SELECT TOP(100) *
 FROM DimCustomer
 -- Mostra os primeiros 100 clientes


-- Exerc�cio 3 b)
SELECT TOP(20) PERCENT *
FROM DimCustomer
-- Mostra os primeiros 20% dos clientes


-- Exerc�cio 3 c)
SELECT TOP(100) FirstName, EmailAddress, BirthDate
FROM DimCustomer
-- Mostra os atributos FirstName, EmailAddress e BirthDate dos primeiros 100 clientes


-- Exerc�cio 3 d)
SELECT FirstName AS "PrimeiroNome", EmailAddress AS "Endere�oEmail", BirthDate AS "DataDeNascimento"
FROM DimCustomer
-- Renomeia FirstName, EmailAddress e BirthDate para o Portugu�s


-- Exerc�cio 4
SELECT Manufacturer AS Fornecedor
FROM DimProduct
-- Renomeia o atributo Manufacturer para o Portugu�s


-- Exerc�cio 5
SELECT *
FROM DimProduct
SELECT *
FROM FactSales
-- Vendo a quantidade de linhas de cada, ve que menos produtos foram vendidos do que j� houveram no estoque