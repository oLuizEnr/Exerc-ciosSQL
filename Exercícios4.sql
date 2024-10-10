SELECT
	DepartmentName,
	COUNT(DepartmentName) AS 'Total  de Funcion�rios'
FROM
	DimEmployee
GROUP BY
	DepartmentName
-- Recolhe o atributo nome do departamento e o retorna distinto, a partir do count verifica a qtd funcionarios em cada departamento

SELECT
	Storetype,
	SUM(employeeCount) AS 'Qtd. Total Funcion�rios'
FROM
	Dimstore
GROUP BY
	Storetype
ORDER BY SUM(EmployeeCount) DESC
-- Recolhe o atributo tipo da loja e o retorna distinto, a partir do sum soma o valor de todos os registros em cada tipo de loja

SELECT
	ColorName AS Cor,
	COUNT(ColorName) AS 'Produtos desta Cor'
FROM
	DimProduct
WHERE
	BrandName = 'Contoso'
GROUP BY
	ColorName
-- Recolhe o atributo nome da cor e o retorna como distinto, a partir do count verifica a quantidade de produtos com esta cor

SELECT
	BrandName AS Marca,
	COUNT(BrandName) AS 'Produtos desta Marca'
FROM
	DimProduct
GROUP BY
	BrandName
HAVING
	COUNT(BrandName) >= 200
-- Recolhe o atributo marca e o retorna distinto, a partir do count verifica a quantidade de produtos desta marca

SELECT
	BrandName AS Marca,
	COUNT(BrandName) AS 'Total Marca'
FROM
	DimProduct
WHERE
	ClassName = 'Economy'
GROUP BY
	BrandName
HAVING
	COUNT(BrandName) >= 200
-- Verifica as marcas distintamente quando o nome de sua classe � "economy" e conta a qtd produtos dela, ent�o exige apenas as marcas que tenham a partir de 200 produtos
-------------------------------------------------------------

-- Exerc�cio 1 a)
SELECT
	channelKey AS 'Canal de Venda',
	SUM(SalesQuantity) AS 'Vendas Totais'
FROM
	FactSales
GROUP BY
	channelKey
-- Qtd vendida em cada canal

-- Exerc�cio 1 b)
SELECT
	StoreKey,
	SUM(SalesQuantity) AS 'Vendas Totais',
	SUM(ReturnQuantity) AS 'Devolu��es Totais'
FROM
	FactSales
GROUP BY
	StoreKey
-- Qtd vendida e devolvida em cada loja

-- Exerc�cio 1 c)
SELECT
	channelKey,
	SUM(SalesAmount) AS 'Quantidade Vendida'
FROM
	FactSales
WHERE
	DateKey BETWEEN ('01/01/2007') and ('31/12/2007')
GROUP BY
	channelKey
-- Qtd vendida em cada canal no ano de 2007

-- Exrc�cio 2 a)
SELECT
	ProductKey AS 'Chave do Produto',
	SUM(SalesAmount) AS 'Faturado'
FROM
	FactSales
GROUP BY
	ProductKey,
	SalesAmount
HAVING
	SUM(SalesAmount) > 5000000
ORDER BY
	SUM(SalesAmount) DESC
-- Produtos que tem faturamento total maior que 5 mil�es em ordem decrescentre

-- exerc�cio 2 b)
SELECT TOP(10)
	ProductKey AS 'Chave do Produto',
	SUM(SalesAmount) AS 'Faturado'
FROM
	FactSales
GROUP BY
	ProductKey
ORDER BY
	SUM(SalesAmount) DESC
-- Top 10 produtos mais vendidos

-- Exerc�cio 3 a)
SELECT TOP(1)
	CustomerKey AS 'Chave do Cliente',
	SUM(SalesQuantity) AS 'Compras realizadas'
FROM
	FactOnlineSales
GROUP BY
	CustomerKey
ORDER BY
	SUM(SalesQuantity) DESC
-- Retorna o ID do cliente que mais comprou

-- Exerc�cio 3 b)
SELECT TOP(3)
	ProductKey,
	SUM(SalesQuantity)
FROM
	FactOnlineSales
WHERE
	CustomerKey = '19037'
GROUP BY
	ProductKey
-- Os 3 produtos mais comprados pelo maior comprador

-- Exerc�cio 4 a)
SELECT
	BrandName,
	COUNT(BrandName) AS Marca
FROM
	DimProduct
GROUP BY
	BrandName
-- Mostra todas as marcas e quantifica todos os produtos que pertencem a elas

-- Exerc�cio 4 b)
SELECT
	ClassName AS Classe,
	AVG(UnitPrice) AS 'M�dia pre�os'
FROM
	DimProduct
GROUP BY
	ClassName
-- Exibe a m�dia dos pre�os dos produtos de cada classe

-- Exerc�cio 4 c)
SELECT
	ColorName AS Cor,
	SUM(Weight) AS 'Peso Total'
FROM
	DimProduct
GROUP BY
	ColorName
-- Mostra o peso de todos os produtos de cada cor

-- Exerc�cio 5
SELECT
	StockTypeName,
	SUM(Weight) AS 'Peso Total'
FROM
	DimProduct
WHERE
	BrandName = 'Contoso'
GROUP BY
	StockTypeName
ORDER BY
	SUM(Weight) DESC
-- Mostra o peso de todos os produtos de cada categoria

-- Exerc�cio 6
SELECT
	BrandName AS Marca,
	COUNT(DISTINCT ColorName) AS Cores 
FROM
	DimProduct
GROUP BY
	BrandName
-- Mostra a qtd cores presentes nos produtos de cada marca

-- Exerc�cio 7
SELECT
	Gender AS G�nero,
	COUNT(CustomerKey) AS 'Qtd. Clientes',
	AVG(YearlyIncome) AS 'M�dia Salarial'
FROM
	DimCustomer
WHERE
	Gender IS NOT NULL
GROUP BY
	Gender
-- Mostra ambos os g�neros, quantos clientes tem e a m�dia salarial de cada

-- Exerc�cio 8
SELECT
	Education AS 'N�vel de Instru��o',
	COUNT(CustomerKey) AS 'Qtd. Clientes',
	AVG(YearlyIncome) AS 'M�dia Salarial'
FROM
	DimCustomer
WHERE
	Education IS NOT NULL
GROUP BY
	Education
-- Retorna os n�veis de educa��o e as qtd. clientes e a m�dia salarial de cada nivel

-- Exerc�cio 9
SELECT
	DepartmentName AS Departamento,
	COUNT(EmployeeKey) AS Funcion�rios
FROM
	DimEmployee
WHERE
	EndDate IS NULL
GROUP BY
	DepartmentName
-- Mostra a quantidade de funcionarios por departamento

-- Exerc�cio 10
SELECT
	Title AS Cargo,
	SUM(VacationHours) AS F�rias
FROM
	DimEmployee
WHERE
	Gender = 'F' AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance') AND HireDate BETWEEN ('1999/01/01') and ('2000/12/31') AND EndDate IS NULL
GROUP BY
	Title
-- Mostra a dura��o das f�rias em horas para cada cargo