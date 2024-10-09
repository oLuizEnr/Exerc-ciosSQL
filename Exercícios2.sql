USE ContosoRetailDW

SELECT TOP(100)
	StoreName,
	employeeCount
FROM DimStore
ORDER BY EmployeeCount DESC
-- Deixa a tabela seguindo uma ordem

SELECT TOP(100)
	ProductName,
	Weight,
	UnitCost
FROM DimProduct
ORDER BY UnitCost DESC, Weight ASC
-- Faz a tabela seguir uma ordem onde o Unitcost é decrescente e o peso é crescente

SELECT
*
FROM
DimProduct

WHERE ProductName LIKE '%MP3%'
-- Mostra todos os registros onde o nome do produto contém "MP3" em qualquer parte do nome

SELECT * FROM DimProduct
WHERE BrandName='Contoso' AND ColorName='Silver'
-- Retorna todos os registros onde o nome da marca é contoso e a cor é prata

SELECT * FROM DimProduct
WHERE ColorName='Blue' OR ColorName='Silver' OR Colorname='Red'
-- Retorna os registros onde as cores são azul ou prata ou vermelho

SELECT * FROM DimProduct
WHERE NOT ColorName='Blue'
-- Retorna todas os registros 

SELECT * FROM DimProduct
WHERE ColorName IN ('Blue', 'Silver', 'Black')
-- Retorna os registros onde as cores são azul ou prata ou preto

SELECT * FROM DimProduct
WHERE ColorName NOT IN ('Blue', 'Silver', 'Black')
-- Retorna os registros onde as cores não são azul ou prata ou preto

SELECT TOP(1000) * FROM FactSales
WHERE SalesQuantity BETWEEN 10 and 15
-- Retorna os registros onde a quantidade de vendas foi entre 10 e 15 (inclue esses valores)

SELECT * FROM DimCustomer
WHERE FirstName IS NOT NULL
-- Retorna os registros ondeo atributo nome não é vazio

----------------------------------------------------------------------------------

--Exercícios

-- 1)
SELECT TOP(100)
	*
FROM
	FactSales
ORDER BY
	SalesAmount DESC
-- Retorna as top 100 maiores vendas

-- 2)
SELECT TOP(10)
	*
FROM
	DimProduct
ORDER BY
	UnitPrice DESC,
	Weight DESC,
	ColorName ASC
	-- OU AvailableforSaleDate ASC na terceira linha do order by
-- Retorna os registros seguindo preço unitário crescente, peso decrescente e nome da cor crescente

-- 3)
SELECT
	ProductName AS "Nome do Produto",
	Weight AS Peso
FROM
	DimProduct
WHERE Weight > 220
ORDER BY
	Weight DESC
-- Retorna Nome e Peso de todos os produtos que tem mais de 100 de peso

-- 4)
SELECT
	StoreName AS "Nome da Loja",
	OpenDate AS "Data de Abertura",
	EmployeeCount AS "Qtd. de Funcionários"
FROM
	DimStore
WHERE
	CloseDate IS NULL  AND StoreType = 'Store'
-- Retorna todas as lojas que não tiveram data de fechamento, ou seja estão ativas

-- 5)
SELECT
	ProductKey
FROM
	DimProduct
WHERE
	AvailableForSaleDate = '15/03/2009' AND BrandName = 'Litware'
-- Retorna o ID dos 3 itens mencionados serem os com defeitos

-- 6)
SELECT
	*
FROM
	DimStore
WHERE
	Status = 'off'

SELECT
	*
FROM
	DimStore
WHERE
	CloseDate IS NOT NULL
-- Duas maneiras diferentes de ter um retorno das lojas fechadas

-- 7)
SELECT
	*
FROM
	DimStore
WHERE
	EmployeeCount BETWEEN 1 and 20
ORDER BY
	EmployeeCount DESC

SELECT
	*
FROM
	DimStore
WHERE
	EmployeeCount BETWEEN 21 and 50
ORDER BY
	EmployeeCount DESC

SELECT
	*
FROM
	DimStore
WHERE
	EmployeeCount > 51
ORDER BY
	EmployeeCount DESC
-- Cada um retorna as lojas de cada categoria da 1 a 3 respectivamente

-- 8)
SELECT
	ProductKey,
	ProductName,
	ProductDescription,
	UnitPrice
FROM
	DimProduct
WHERE
	ProductDescription LIKE '%LCD%'
-- Retorna todos os produtos que tenham o nome LCD dentro

-- 9)
SELECT
	*
FROM
	DimProduct
WHERE
	ColorName IN ('Green', 'Black', 'Silver', 'Pink', 'Orange') AND BrandName IN ('Contoso', 'Litware', 'Fabrikam')
-- Retorna produtos que tem cor verde, preta, prata ou laranja e das marcas contoso litwaree fabrikam

-- 10)
SELECT
	*
FROM
	DimProduct
WHERE
	ColorName = 'Silver' AND BrandName = 'Contoso' AND UnitPrice BETWEEN 10 and 30
ORDER BY
	UnitPrice DESC
-- Retorna todos os produtos prata em ordem descrecente a partir de seu preço unitario