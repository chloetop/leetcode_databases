# Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.
# Table: Customers.
# +----+-------+
# | Id | Name  |
# +----+-------+
# | 1  | Joe   |
# | 2  | Henry |
# | 3  | Sam   |
# | 4  | Max   |
# +----+-------+
# Table: Orders.
# +----+------------+
# | Id | CustomerId |
# +----+------------+
# | 1  | 3          |
# | 2  | 1          |
# +----+------------+

# Create an intermediate table where all customers are linked to their orders
# including null if no orders.

SELECT Customers.Name AS Customers
FROM (Customers LEFT OUTER JOIN Orders on Customers.Id=Orders.CustomerId)
WHERE Orders.Id IS NULL;