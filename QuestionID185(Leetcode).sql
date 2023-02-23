-- SQL Schema
-- Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
-- id is the primary key column for this table.
-- departmentId is a foreign key of the ID from the Department table.
-- Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
 

-- Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table indicates the ID of a department and its name.
 

-- A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
-- Write an SQL query to find the employees who are high earners in each of the departments.
-- Return the result table in any order.

-- Code:
with cte1 as (Select b.name as 'Department', a.name as 'Employee', a.salary as 'Salary', Dense_Rank() Over (Partition by b.name Order by a.salary desc) as 'SalaryRnk'
from Employee a
Inner Join Department b
on a.departmentId=b.id)

Select Department, Employee, Salary from cte1
where SalaryRnk <=3