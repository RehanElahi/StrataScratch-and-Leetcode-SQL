-- Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 

-- Write an SQL query to find the employees who earn more than their managers.

-- Return the result table in any order.

-- Solution using subquery
select name as 'Employee'
from Employee a
where a.managerId IN
(Select id
from Employee b
where a.salary>b.salary)

-- Solution using join
select e1.name as 'Employee'
from employee e1
Inner JOIN employee e2 ON e1.managerID=e2.id
where e1.salary> e2.salary
