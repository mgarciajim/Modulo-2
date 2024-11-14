
# Para buscar información

SELECT *
FROM tienda.orders;

SELECT 
DISTINCT(country)
FROM customers;

# Seleccionamos tienda

USE tienda; 

# 1.Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.

SELECT 
	MIN(customer_number) AS Mincustomer    
FROM customers;  
   
# 2.Selecciona el limite de crédito medio para los clientes de España.  

SELECT 
	AVG(credit_limit) AS credit_limit_medio
FROM customers
WHERE country = 'Spain';

SELECT *
FROM customers
WHERE country = 'Spain';

# 3.Selecciona el numero de clientes en Francia.

SELECT 
	COUNT(customer_number) AS Countcustomer_number
FROM customers
WHERE country = 'France';

# 4.Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.

SELECT 
	MAX(credit_limit) AS MaxCredit_Limit
FROM customers
WHERE sales_rep_employee_number = 1323;

# 5.¿Cuál es el número máximo de empleado de la tabla customers?

SELECT 
	MAX(sales_rep_employee_number) AS Maxsales_rep_employee_number
FROM customers;

# 6.Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno.

SELECT sales_rep_employee_number, 
	COUNT(DISTINCT(customer_number)) AS NumberClientesDistintos
FROM customers
GROUP BY sales_rep_employee_number; 

# 7.Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.

SELECT sales_rep_employee_number,
	COUNT(DISTINCT customer_number)
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(DISTINCT customer_number) > 7;

#BONUS#
# 8.Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.

SELECT sales_rep_employee_number,
	COUNT(DISTINCT(customer_number)),
CASE 
    WHEN COUNT(DISTINCT(customer_number))  < 2 THEN "BajoRendimiento"   
    WHEN COUNT(DISTINCT(customer_number))  > 7 THEN "AltoRendimiento"  
    ELSE "MediaRendimiento"   
    END AS Rendimiento
FROM customers
GROUP BY sales_rep_employee_number;

#Otro ejemplo 
SELECT sales_rep_employee_number,
	COUNT(DISTINCT(customer_number)),
CASE 
    WHEN COUNT(DISTINCT(customer_number))  > 7 THEN "AltoRendimiento"  
    ELSE "BajoRendimiento"
    END AS rendimiento    
FROM customers
GROUP BY sales_rep_employee_number;

# 9. Selecciona el número de clientes en cada país.

SELECT country,
	COUNT(DISTINCT customer_number)
FROM customers
GROUP BY country;

# 10.Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.   
  	
SELECT country,
    COUNT(DISTINCT city) AS number_city
FROM customers
GROUP BY country
HAVING COUNT(DISTINCT city) > 3;

# Otro ejemplo
SELECT country,
    COUNT(DISTINCT city) AS number_city
FROM customers
GROUP BY country
HAVING number_city > 3;