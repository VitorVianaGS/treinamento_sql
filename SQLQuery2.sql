USE AdventureWorks2017; -- Para escolher a base de dados

-- Select - especifíca o que você quer pesquisar
SELECT *
FROM person.Person;

SELECT Title
FROM person.person;

SELECT *
FROM person.EmailAddress;

-- #Desafio - separar apenas nome e sobrenome da tabela person
SELECT FirstName, LastName
FROM person.person;

-- -------------------------------------------------------------------

-- Distinct - remove itens duplicados da coluna pesquisada
SELECT DISTINCT FirstName 
FROM person.Person;

-- #Desafio - quantos sobrenomes únicos temos na tabela person
SELECT DISTINCT LastName
FROM Person.Person;

-- -------------------------------------------------------------------

-- WHERE - Coloca condições para query
SELECT *
FROM Person.Person
WHERE LastName = 'miller' and FirstName = 'anna';

SELECT *
FROM Production.Product
WHERE color = 'blue' or color = 'black';

SELECT *
FROM Production.Product
WHERE ListPrice > 1500 and ListPrice < 2000;

SELECT *
FROM Production.Product
WHERE Color <> 'red';

-- #Desafio 1 - a equipe de produção precisa do nome de todas as peças que pesam mais de 500kg e menos de 700 para inspeção
SELECT Name
FROM Production.Product
WHERE Weight > 500 and Weight < 700;

-- #Desafio 2 - foi pedido pelo marketing uma relação de todos os empregados(employees) que são casados(married) e são assalariados(salaried)
SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'm' and SalariedFlag = 1;

-- #Desafio 3 - um usuario chamdo Peter Krebs está devendo um pagamento, consiga o e-mail dele para enviarmos uma cobrança
-- #Dica - vai ter que usar a tabela person.person e depois a tabela person.emailaddress
SELECT *
FROM Person.Person
WHERE FirstName = 'peter' and LastName = 'krebs'

SELECT *
FROM Person.emailaddress
WHERE BusinessEntityID = 26

-- -------------------------------------------------------------------

-- COUNT - Conta quantas linhas tem em uma tabela
SELECT COUNT(DISTINCT title)
FROM person.Person;

-- #Desafio 1 - quantos produtos temos cadastrados em nossa tabela de produtos(production.product)
SELECT COUNT(*)
FROM Production.Product;

-- #Desafio 2 - quantos tamanhos de produtos temos cadastrados em nossa tabela(production.product)
SELECT COUNT(Size)
FROM Production.Product;

-- #Desafio 3 - quantos tamanhos diferentes de produtos temos cadastrados em nossa tabela(production.product)
SELECT COUNT(DISTINCT size)
FROM Production.Product;

-- -------------------------------------------------------------------

-- TOP - Limita a quantidade de linhas que você definir
SELECT TOP 10 *
FROM Production.Product;

-- -------------------------------------------------------------------

-- Order By - Organiza alguma coluna de forma crescente ou decrescente
SELECT FirstName, LastName,MiddleName
FROM Person.Person
ORDER BY FirstName asc, LastName desc, MiddleName asc

-- #Desafio 1 - Obter o ProductId dos 10 produtos mais caros cadastrados no sistema, listando do mais caro para o mais barato
SELECT TOP 10 ProductId
FROM Production.Product
ORDER BY ListPrice desc;

-- #Desafio 2 - obter o nome e número dos produtos que tem o ProductId entre 1~4
SELECT TOP 4 name, ProductNumber
FROM Production.Product
ORDER BY ProductID asc

-- -------------------------------------------------------------------

-- Between - usado para encontrar um valor entre o minimo e o máximo

SELEcT *
FROM Production.Product
WHERE ListPrice NOT between 1000 and 1500; -- O operador NOT serve como inversor

SELECT *
FROM HumanResources.Employee
WHERE HireDate between '2009/01/01' and '2010/01/01'
ORDER BY HireDate asc;

-- -------------------------------------------------------------------

-- In - Geralmente utilizado com WHERE, verififca se um valor corresponde com qualqeur valor passado na lista de valores.

SELECT *
FROM Person.Person
WHERE BusinessEntityID in (2,7,13);

-- -------------------------------------------------------------------

-- LIKE - O `LIKE` filtra registros no SQL buscando padrões específicos de texto através dos coringas `%` e `_`.

SELECT *
FROM Person.person
WHERE FirstName like 'ovi%' -- completa o fim do nome

SELECT *
FROM Person.person
WHERE FirstName like '%to' -- completa o inicio do nome

SELECT *
FROM Person.person
WHERE FirstName like '%essa%' -- completa as estremidades do nome

SELECT *
FROM Person.person
WHERE FirstName like '%ro_' -- completa 1 caractere no fim

-- -------------------------------------------------------------------

-- #Desafio Fundamentos SQL

-- #Desafio 1 - Quantos produtos temos cadastrados no sistema que custam mais de 1500 dólares?
SELECT COUNT (ListPrice)
FROM Production.Product
WHERE ListPrice > 1500;

-- #Desafio 2 - Quantas pessoas temos com o sobrenome que inicia com a letra P?
SELECT COUNT (LastName)
FROM Person.Person
WHERE LastName like 'p%'

-- #Desafio 3 - Em quantas cidades únicas estão cadastrados nossos clientes?
SELECT count(DISTINCT City)
FROM Person.Address

-- #Desafio 4 - Quais são as cidades únicas cadastradas em nosso sistema?
SELECT DISTINCT City
FROM Person.Address
ORDER BY City asc;

-- #Desafio 5 - Quantos produtos vermelhos tem preço entre 500 e 1000 dólares?
Select COUNT(*)
FROM Production.Product
WHERE Color = 'red'
and ListPrice between 500 and 1000;

-- #Desafio 6 - Quantos produto cadastrados tem 'road' no nome deles?
SELECT COUNT(*)
FROM Production.Product
WHERE Name like '%road%';

-- -------------------------------------------------------------------

-- Min Max Sum Avg - Funções de agregação basicamente agregam ou combinam dados de uma tabela em um resultado só

SELECT top 10 sum(linetotal) as Soma
FROM Sales.SalesOrderDetail

SELECT TOP 10 MIN(LineTotal) as Minimo
FROM Sales.SalesOrderDetail

SELECT TOP 10 MAX(LineTotal) as Maximo
FROM Sales.SalesOrderDetail

SELECT TOP 10 AVG(LineTotal) as Média
FROM Sales.SalesOrderDetail

-- -------------------------------------------------------------------
-- Intermediário
-- -------------------------------------------------------------------

-- GROUP BY - Divide o resultado da sua pesquisa em grupos
-- Para cada grupo você pode aplicar uma função de agregação, ex:
--	Calcular a soma de itens
--	Contar o nnúmero de itens naquele grupo

SELECT *
FROM Sales.SalesOrderDetail

SELECT SpecialOfferID, SUM(UnitPrice) AS Soma
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID

-- Exemplo: Quantos de cada produto foi vendido até hoje?
SELECT ProductID, COUNT(ProductID) AS Contagem
FROM Sales.SalesOrderDetail
GROUP BY ProductID

-- Exemplo: Quantos nomes de cada nome, temos cadastrados em nosso banco de dados?
SELECT FirstName, COUNT(FirstName) AS Contagem
FROM Person.Person
GROUP BY FirstName

-- Exemplo: Na tabela production.product quero saber a média de preços para os produtos da cor prata(silver).
SELECT Color, AVG(listPrice) AS Média
FROM Production.Product
WHERE Color = 'silver'
GROUP BY Color

-------------------------------------------------------------------

-- #Desafio 1 - Quantas pessoas tem o mesmo MiddleName agrupadas por MiddleName?
SELECT MiddleName, COUNT(MiddleName) AS Contagem
FROM Person.Person
GROUP BY MiddleName

-- #Desafio 2 - Quero saber a média da quantidade de cada produto que é vendido na loja.
SELECT ProductID , AVG(OrderQty) AS Média
FROM Sales.SalesOrderDetail
GROUP BY ProductID

-- #Desafio 3 - Quais foram as dez vendas que no total tiveram os maiores valores de venda (line total) por produto, do maior para o menor?
SELECT TOP(10) ProductID, SUM(linetotal) AS Vendas
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY Vendas DESC

-- #Desafio 4 - Quantos produtos, e qual quantidade média de produtos, temos cadastrados em nossa ordem de serviço(workorder), agrupados por ProductID?
SELECT ProductID, COUNT(ProductID) AS contagem,
AVG(OrderQty) AS Média
FROM Production.WorkOrder
GROUP BY ProductID

-- -------------------------------------------------------------------

-- Having - Usado em junção ao GROUP BY para filtrar resultados de um agrupamento

-- --------------------------------------------------------------------

-- Funciona como um Where para dados agrupados
-- A grande diferença entre HAVING e WHERE:
-- Having - é aplicado depois que os dados ja foram agrupados
-- Where - é aplicado antes dos dados serem aplicados

/* Formatação

Select coluna1, funcaoAgragacao(coluna2)
From nomeTabela
Group By Coluna1
Having condicao

*/

-- Exemplo: Quero saber quais nomes no sistema tem uma ocorrência maior que 10 vezes,
-- Porém somente onde o titulo é 'Mr.'.

select FirstName, count(FirstName) as qtd
from Person.Person
where Title = 'Mr.'
group by FirstName
having count(FirstName) > 10
order by qtd asc

-- Exemplo 2: Quais produtos que no total de vendas estão entre 162k a 500k?

SELECT TOP 10 *
FROM Sales.SalesOrderDetail

SELECT ProductID, SUM(LineTotal) as "TOTAL"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) between 162000 and 500000;

-- --------------------------------------------------------------------

-- Desafio 1 - Queremos identificar as províncias(stateProvinceId) com o maior número de cadastros em nosso sistema,
-- então é preciso encontrar quais províncias(stateProvinceId) estão registradas no banco de dados mais que 1000 vezes.
-- Dica: tabela person.address, usar having, count e operadores matemáticos.

SELECT stateProvinceId, COUNT(stateProvinceId) as "Total" 
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000; 

-- Desafio 2 - Sendo que se trata de uma multinacional os gerentes querem saber quais produtos(productId) não estão trazendo
-- em média 1 milhão em total de vendas(lineTotal)

SELECT productId, COUNT(lineTotal) as total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(lineTotal) < 1000000
ORDER BY total desc

-- --------------------------------------------------------------------

-- AS - serve para renomear uma linhacoluna

SELECT TOP 10 listPrice as "Preço do produto"
FROM Production.Product

SELECT TOP 10 AVG(listprice) as "Preço Médio"
FROM Production.Product

-- --------------------------------------------------------------------
-- Desafio 1: encontrar o FirstName e LastName person.person
SELECT firstName as "Primeiro Nome", lastName as "Último Nome"
FROM person.Person

-- Desafio 2: ProductNumber da tabela Production.product "Numero do Produto"
SELECT ProductNumber as "Número do Produto"
FROM Production.Product

-- Desafio 3: sales.SalesOrderDetail unitPrice "Preço Unitário"
SELECT unitPrice as "Preço Unitário"
FROM Sales.SalesOrderDetail

-- --------------------------------------------------------------------
-- INNER JOIN










-- --------------------------------------------------------------------
-- PAREI AOS 1:32:58 https://www.youtube.com/watch?v=G7bMwefn8RQ