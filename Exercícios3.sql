USE ContosoRetailDW

SELECT
	COUNT(CustomerKey) AS 'Qtd. Mulheres'
FROM
	DimCustomer
WHERE
	Gender = 'F'
-- Conta a quantidade de linhas

SELECT
	COUNT(DISTINCT DepartmentName) AS 'Qtd. �reas'
FROM
	DimEmployee
-- Conta a quantidades de linhas (Cada valor � considerado uma s� vez)

SELECT
	SUM(SalesQuantity) AS 'Total Vendido'
FROM
	FactSales
WHERE
	UnitPrice >= 100
-- Soma os valores de todas as linhas

SELECT
	AVG(SalesQuantity) AS 'M�dia de Vendas'
FROM
	factSales
WHERE
	UnitPrice >= 100
--

SELECT
	MIN(SalesQuantity) AS 'Min Venda'
FROM
	FactSales

SELECT
	MAX(SalesQuantity) As 'Max Venda'
FROM
	FactSales

---------------------------------------------------------------------
--EXERC�CIOS

-- 1)
SELECT
	SUM(SalesQuantity) AS 'Qtd. Vendas', 
	SUM(ReturnQuantity) AS 'Qtd. Devolvida'
FROM
	FactSales
WHERE
	channelKey = 1
-- Verifica a soma de todas as vendas e a soma das retornadas

-- 2)
SELECT
	AVG(YearlyIncome) AS 'Renda Anual'
FROM
	DimCustomer
WHERE
	Occupation = 'Professional'
-- Adquiri a m�dia de todos os sal�rios de clientes que tem ocupa��o profissional

-- 3)
SELECT
	StoreName AS 'Nome da Loja',
	EmployeeCount As 'Qtd. Funcion�rios'
FROM
	DimStore
WHERE
	EmployeeCount=(SELECT MAX(EmployeeCount) FROM DimStore)
-- Loja com mais funcion�rios

SELECT
	StoreName AS 'Nome da Loja',
	EmployeeCount As 'Qtd. Funcion�rios'
FROM
	DimStore
WHERE
	EmployeeCount=(SELECT MIN(EmployeeCount) FROM DimStore)
-- Loja com menos funcion�rios

-- 4)
SELECT
	COUNT(Gender)
FROM
	DimEmployee
WHERE
	Gender = 'F'
-- Conta qtd. mulheres na empresa

SELECT
	COUNT(Gender)
FROM
	DimEmployee
WHERE
	Gender = 'M'
-- Conta qtd. homens na empresa

SELECT TOP(1)
	StartDate,
	FirstName,
	Emailaddress,
	HireDate
FROM
	DimEmployee
WHERE
	Gender = 'F' AND EndDate IS NULL
-- Funcion�ria mulher mais antiga

SELECT TOP(1)
	StartDate,
	FirstName,
	Emailaddress,
	HireDate
FROM
	DimEmployee
WHERE
	Gender = 'M' AND EndDate IS NULL
-- Funcion�rio homem mais antigo

-- 5)
SELECT
	COUNT(DISTINCT ClassName) AS Classe,
	COUNT(DISTINCT ColorName) AS Cor,
	COUNT(DISTINCT BrandName) AS Marca
FROM
	DimProduct
-- Conta a quatidade distinta de cada um dos atributos entre Classe, Cor e Marca