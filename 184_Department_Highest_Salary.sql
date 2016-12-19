# The Employee table holds all employees. Every employee has an Id, a salary, 
# and there is also a column for the department Id.
#+----+-------+--------+--------------+
#| Id | Name  | Salary | DepartmentId |
#+----+-------+--------+--------------+
#| 1  | Joe   | 70000  | 1            |
#| 2  | Henry | 80000  | 2            |
#| 3  | Sam   | 60000  | 2            |
#| 4  | Max   | 90000  | 1            |
#+----+-------+--------+--------------+
# The Department table holds all departments of the company.
#+----+----------+
#| Id | Name     |
#+----+----------+
#| 1  | IT       |
#| 2  | Sales    |
#+----+----------+
# Write a SQL query to find employees who have the highest salary in each of the departments.

# Create a temp table of max salary by DepartmentId.  Join temp to Employee
# on Salary and departmentId.

SELECT d.Name as Department, e.Name as Employee, e.Salary
FROM Department d, Employee e,
    (SELECT MAX(Salary) as maxSal, DepartmentId FROM Employee GROUP BY DepartmentId) temp
WHERE
e.DepartmentId = d.Id AND
e.Salary = temp.maxSal AND
e.DepartmentId = temp.DepartmentId;