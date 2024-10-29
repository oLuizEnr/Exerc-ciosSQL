-- EXEMPLO LEFT JOIN
SELECT
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
FROM
	Produtos
LEFT JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria

-- EXEMPLO RIGHT JOIN
SELECT
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
FROM
	Produtos
RIGHT JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria

-- EXEMPLO INNER JOIN
SELECT
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
FROM
	Produtos
INNER JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria

-- EXEMPLO FULLL JOIN
SELECT
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
FROM
	Produtos
FULL JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria

-- EXEMPLO LEFT ANTI JOIN
SELECT
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
FROM
	Produtos
LEFT JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE
	subcategoria.id_subcategoria IS  NULL

-- EXEMPLO RIGHT ANTI JOIN
SELECT
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
FROM
	Produtos
RIGHT JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE
	produtos.id_subcategoria IS NULL

-- EXEMPLO FULL ANTI JOIN
SELECT
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
FROM
	Produtos
FULL JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE
	produtos.id_subcategoria IS NULL OR subcategoria.id_subcategoria IS NULL

-- EXERCÍCIOS
-- 1)
SELECT
	ProductKey AS 'Chave do Produto',
	ProductSubcategoryName AS 'Nome da Subcategoria'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
-- Retorna a chave do produto e a sua subcategoria

-- 2)
SELECT	*
FROM DimProductSubcategory
SELECT *
FROM DimProductCategory
-- Identificado o atributo 'ProductCategoryKey' em ambas as tabelas
SELECT
	ProductSubcategoryKey AS 'Chave da Subcategoria',
	ProductSubcategoryName AS 'Nome da Subcategoria',
	ProductCategoryName AS 'Nome da Categoria'
FROM
	DimProductSubcategory
LEFT JOIN DimProductCategory
	ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
-- Une as tabelas de subcategoria e categoria, usando atributos de uma para complementar a outra

-- 3)
SELECT
	StoreKey AS 'Chave da Loja',
	StoreName AS 'Nome da Loja',
	EmployeeCount AS 'Qtd. Funcionários',
	ContinentName AS Continente,
	RegionCountryName AS País
FROM
	DimStore
LEFT JOIN DimGeography
	ON DimStore.GeographyKey = DimGeography.GeographyKey
-- Diz a chave da loja, nome da loja, quantidade de funcionários, continente e país, ao unir as tabelas DimStore e DimGeography

-- 4)
SELECT
	ProductKey AS 'Chave do  Produto',
	ProductName AS 'Nome do Produto',
	ProductDescription AS 'Descrição do Produto',
	ProductCategoryName AS 'Nome Categoria',
	ProductCategoryDescription AS 'Descrição da Categoria'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
LEFT JOIN DimProductCategory
	ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
-- Retorna a chave do produto, nome, descrição e nome da categoria junto da desrição.

-- 5)
-- a:
SELECT TOP(100)
    *
FROM
    FactStrategyPlan
-- Reconhece a tabela
-- b:
SELECT
    StrategyPlanKey AS 'ID_Plano',
    DateKey AS 'ID_Info',
    AccountName AS 'Nome da Conta',
    Amount AS Quantidade
FROM
    FactStrategyPlan
INNER JOIN DimAccount
    ON FactStrategyPlan.AccountKey = DimAccount.AccountKey
-- Retorna o nome da conta junto dos atributos da tabela FactStrategyPlan

-- 6)
SELECT
    StrategyPlanKey AS 'ID_Plano',
    DateKey AS 'ID_Info',
    ScenarioName AS 'Nome do cenário',
    Amount AS Quantidade
FROM
    FactStrategyPlan
INNER JOIN DimScenario
    ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
-- Retorna o id do plano, o id da info, nome do cenário e a qtd.

-- 7)
SELECT
	ProductSubcategoryName AS 'Nome da Subcategoria',
    COUNT(ProductKey) AS 'Qtd. Produtos'
FROM
    DimProductSubcategory
INNER JOIN DimProduct
    ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
GROUP BY
	ProductSubcategoryName
HAVING
	COUNT(ProductKey) = 0
-- Retorna as subcategorias que tem qtd. de produtos igual a 0, no caso nenhuma

-- 8)
SELECT DISTINCT
    BrandName AS Marca,
    DimChannel.ChannelName AS Canal
FROM
	DimProduct
CROSS JOIN DimChannel
WHERE
	BrandName IN ('Contoso', 'Fabrikam', 'Litware')
-- Mostra os canais que cada uma das 3 marcas contém

-- 9)
SELECT
	FactOnlineSales.OnlineSalesKey AS 'ID Venda Online',
	DateKey AS 'ID Data',
	DimPromotion.PromotionName AS 'Nome Promoção',
	SalesAmount 'Total vendas'
FROM FactOnlineSales
INNER JOIN DimPromotion
	ON FactOnlineSales.PromotionKey = DimPromotion.PromotionKey
WHERE
	DimPromotion.PromotionName <> 'No Discount'
ORDER BY
	DateKey
-- Mostra diversas informações sobre vendas, como o ID, sua Data, A promoção usada e o total de vendas

-- 10)
SELECT
	SalesKey AS 'ID Venda',
	ChannelName AS 'Nome do Canal',
	StoreName AS 'Nome da Loja',
	ProductName AS 'Nome do Produto',
	SalesAmount As 'Total Vendas'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
-- Retorna a tabela esperada pelo exercício