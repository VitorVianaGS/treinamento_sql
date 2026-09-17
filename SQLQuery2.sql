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

-- GROUP BY - 















-- PAREI AOS 1:04:00 https://www.youtube.com/watch?v=G7bMwefn8RQ