#Consulta para obtener los nombres, teléfonos y direcciones de todas las empresas cliente de la tabla customers:
SELECT
	customer_name,
	phone,
    address_line1,
	address_line2
FROM customers;
#Consulta para obtener los teléfonos y direcciones de las empresas que se encuentren en USA:
SELECT 
	phone , 
    address_line1
    address_line2
FROM customers
WHERE country = "USA";
#Consulta para obtener los nombres y apellidos de las personas de contacto en cada empresa que no tiene segunda línea de dirección:
SELECT
	customer_name,
    contact_last_name,
    contact_first_name
FROM customers  
WHERE address_line2 IS NULL;

#Consulta para buscar los registros de la tabla customersque tengan un valor guardado para el campo state:
SELECT *
FROM customers
WHERE state IS NOT NULL;
#Consulta para encontrar clientes de USA sin estado:
SELECT *
FROM customers
WHERE country ="USA" AND state IS NULL;
#Consulta para seleccionar el país de los clientes con límite de crédito mayor a $10,000:
SELECT *
FROM customers
WHERE credit_limit >10000;

#Ejercicios extras
USE northwind;

SELECT 
	employeeID AS id,
    lastname AS lastname,
    firstname AS firstname
FROM employees;

#Conociendo los productos más baratos :
SELECT 
	product_name, 
    list_price
FROM products
WHERE list_price BETWEEN 0 AND 5;

#Conociendo los productos que no tienen precio :
SELECT *
FROM products
WHERE unitprice IS NULL;

#Comparando productos (precio menor a 15 dólares y ID menor que 20):
SELECT *
FROM products
WHERE unitprice < 15 AND product_id < 20;

#crear una consulta que muestre los primeros 10 productos según su ID, junto con sus nombres y precios
SELECT 
	productid,
	productname,
    unitprice
FROM products
LIMIT 10;

SELECT ProductID, ProductName, UnitPrice
FROM Products
ORDER BY ProductID
LIMIT 10;

#obtener los últimos 10 productos ordenados por su ID de manera descendente
SELECT 
	productid,
    productname,
    unitprice
FROM products
ORDER BY productid DESC
LIMIT 10;

# Nos interesa conocer los distintos pedidos que hemos tenido (mostrar los valores únicos de ID en la tabla order_details).
SELECT DISTINCT OrderID
FROM orderdetails;

#BONUS
#Esta consulta multiplica el precio unitario ( unit_price) por la cantidad ( quantity) para calcular el ingreso total por cada detalle de pedido y luego ordena los resultados en orden descendente para obtener los 3 primeros:
SELECT orderid, 
       SUM(unitprice * quantity) AS total_income
FROM orderdetails
GROUP BY orderid
ORDER BY total_income DESC
LIMIT 3;
#Descripción de la consulta:
#SELECCIONAR : Se selecciona order_idy se calcula el ingreso total como la suma de unit_price * quantitypara cada pedido.

#FROM order_details : Indica que se están utilizando los datos de la tabla order_details.

#GROUP BY order_id : Agrupa los resultados por order_id, lo que significa que la suma del ingreso total se calculará por cada pedido.

#ORDER BY total_ Income DESC : Ordena los resultados por el ingreso total en orden descendente, de modo que los pedidos con mayores ingresos aparezcan primero.

#LIMIT 3 : Limita el resultado a solo los 3 primeros pedidos.

#seleccionar el ID de los pedidos situados entre la 5 y la 10 mejor posición en cuanto al coste económico total ImporteTotal
SELECT orderid
FROM orders
ORDER BY total_income DESC
LIMIT 5 OFFSET 4;

#Selecciona envíos con retraso:
SELECT 
    orderid,  -- Seleccionamos el ID del pedido
    ShippedDate,  -- Seleccionamos la fecha original de envío
    DATE_ADD(ShippedDate, INTERVAL 5 DAY) AS FechaRetrasada  -- Calculamos la nueva fecha añadiendo 5 días y le damos un nuevo nombre
FROM 
    orders;  -- Indicamos que estamos seleccionando desde la tabla 'orders'
    
#Selecciona los productos más rentables:
SELECT *
FROM products
WHERE unitprice BETWEEN  15 AND 50;

#Selecciona los productos con unos precios dados:
SELECT *
FROM products
WHERE unitprice IN("18", "19", "20");