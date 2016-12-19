# The Employee table holds all employees. Every employee has an Id, a salary, 
# and there is also a column for the department Id.
#+----+-------+--------+--------------+
#| Id | Name  | Salary | DepartmentId |
#+----+-------+--------+--------------+
#| 1  | Joe   | 70000  | 1            |
#| 2  | Henry | 80000  | 2            |
#| 3  | Sam   | 60000  | 2            |
#| 4  | Max   | 90000  | 1            |
#| 5  | Janet | 69000  | 1            |
#| 6  | Randy | 85000  | 1            |
#+----+-------+--------+--------------+
# The Department table holds all departments of the company.
#+----+----------+
#| Id | Name     |
#+----+----------+
#| 1  | IT       |
#| 2  | Sales    |
#+----+----------+
# Write a SQL query to find employees who earn the top three salaries in each of the department. 
# For the above tables, your SQL query should return the following rows.
# Department, Employee, Salary.

# Select employees that have fewer than 3 other employees earning more in same department.

SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Department d, Employee e
WHERE (SELECT COUNT(DISTINCT(Salary)) FROM Employee ee WHERE 
	ee.Salary > e.Salary AND ee.DepartmentId = e.DepartmentId) < 3
AND e.DepartmentId = d.Id
ORDER by e.DepartmentId, e.Salary DESC;