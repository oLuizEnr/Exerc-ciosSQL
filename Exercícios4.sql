SELECT
	DepartmentName,
	COUNT(DepartmentName) AS 'Total  de Funcionários'
FROM
	DimEmployee
GROUP BY
	DepartmentName
-- Recolhe o atributo nome do departamento e o retorna distinto, a partir do count verifica a qtd funcionarios em cada departamento

SELECT
	Storetype,
	SUM(employeeCount) AS 'Qtd. Total Funcionários'
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
-- Verifica as marcas distintamente quando o nome de sua classe é "economy" e conta a qtd produtos dela, então exige apenas as marcas que tenham a partir de 200 produtos
-------------------------------------------------------------

-- Exercício 1 a)
SELECT
	channelKey AS 'Canal de Venda',
	SUM(SalesQuantity) AS 'Vendas Totais'
FROM
	FactSales
GROUP BY
	channelKey
-- Qtd vendida em cada canal

-- Exercício 1 b)
SELECT
	StoreKey,
	SUM(SalesQuantity) AS 'Vendas Totais',
	SUM(ReturnQuantity) AS 'Devoluções Totais'
FROM
	FactSales
GROUP BY
	StoreKey
-- Qtd vendida e devolvida em cada loja

-- Exercício 1 c)
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

-- Exrcício 2 a)
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
-- Produtos que tem faturamento total maior que 5 milões em ordem decrescentre

-- exercício 2 b)
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

-- Exercício 3 a)
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

-- Exercício 3 b)
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

-- Exercício 4 a)
SELECT
	BrandName,
	COUNT(BrandName) AS Marca
FROM
	DimProduct
GROUP BY
	BrandName
-- Mostra todas as marcas e quantifica todos os produtos que pertencem a elas

-- Exercício 4 b)
SELECT
	ClassName AS Classe,
	AVG(UnitPrice) AS 'Média preços'
FROM
	DimProduct
GROUP BY
	ClassName
-- Exibe a média dos preços dos produtos de cada classe

-- Exercício 4 c)
SELECT
	ColorName AS Cor,
	SUM(Weight) AS 'Peso Total'
FROM
	DimProduct
GROUP BY
	ColorName
-- Mostra o peso de todos os produtos de cada cor

-- Exercício 5
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

-- Exercício 6
SELECT
	BrandName AS Marca,
	COUNT(DISTINCT ColorName) AS Cores 
FROM
	DimProduct
GROUP BY
	BrandName
-- Mostra a qtd cores presentes nos produtos de cada marca

-- Exercício 7
SELECT
	Gender AS Gênero,
	COUNT(CustomerKey) AS 'Qtd. Clientes',
	AVG(YearlyIncome) AS 'Média Salarial'
FROM
	DimCustomer
WHERE
	Gender IS NOT NULL
GROUP BY
	Gender
-- Mostra ambos os gêneros, quantos clientes tem e a média salarial de cada

-- Exercício 8
SELECT
	Education AS 'Nível de Instrução',
	COUNT(CustomerKey) AS 'Qtd. Clientes',
	AVG(YearlyIncome) AS 'Média Salarial'
FROM
	DimCustomer
WHERE
	Education IS NOT NULL
GROUP BY
	Education
-- Retorna os níveis de educação e as qtd. clientes e a média salarial de cada nivel

-- Exercício 9
SELECT
	DepartmentName AS Departamento,
	COUNT(EmployeeKey) AS Funcionários
FROM
	DimEmployee
WHERE
	EndDate IS NULL
GROUP BY
	DepartmentName
-- Mostra a quantidade de funcionarios por departamento

-- Exercício 10
SELECT
	Title AS Cargo,
	SUM(VacationHours) AS Férias
FROM
	DimEmployee
WHERE
	Gender = 'F' AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance') AND HireDate BETWEEN ('1999/01/01') and ('2000/12/31') AND EndDate IS NULL
GROUP BY
	Title
-- Mostra a duração das férias em horas para cada cargo