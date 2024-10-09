USE ContosoRetailDW

-- Exercício 1 a)
SELECT *
FROM DimProduct
-- Existem ainda 2517 produtos cadastrados


-- Exercício 1 b)
SELECT *
FROM DimCustomer
-- Diminuiu, já que não só existem bem menas linhas como as chaves dos cliente sequer chegam a 19200


-- Exercício 2 a)
SELECT CustomerKey, FirstName, EmailAddress, BirthDate
FROM DimCustomer
-- Selecionou as colunas que guardam a chave, nome, email e data de nascimento do consumidor


-- Exercício 2 b)
SELECT CustomerKey AS "ChaveClient", FirstName AS "Nome", EmailAddress AS "Email", BirthDate AS "DDN"
FROM DimCustomer
-- Renomeado os atributos para português


-- Exercício 3 a)
 SELECT TOP(100) *
 FROM DimCustomer
 -- Mostra os primeiros 100 clientes


-- Exercício 3 b)
SELECT TOP(20) PERCENT *
FROM DimCustomer
-- Mostra os primeiros 20% dos clientes


-- Exercício 3 c)
SELECT TOP(100) FirstName, EmailAddress, BirthDate
FROM DimCustomer
-- Mostra os atributos FirstName, EmailAddress e BirthDate dos primeiros 100 clientes


-- Exercício 3 d)
SELECT FirstName AS "PrimeiroNome", EmailAddress AS "EndereçoEmail", BirthDate AS "DataDeNascimento"
FROM DimCustomer
-- Renomeia FirstName, EmailAddress e BirthDate para o Português


-- Exercício 4
SELECT Manufacturer AS Fornecedor
FROM DimProduct
-- Renomeia o atributo Manufacturer para o Português


-- Exercício 5
SELECT *
FROM DimProduct
SELECT *
FROM FactSales
-- Vendo a quantidade de linhas de cada, ve que menos produtos foram vendidos do que já houveram no estoque