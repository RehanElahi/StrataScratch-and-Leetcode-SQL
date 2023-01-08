-- Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
 
-- Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

-- Code
WITH t as (
Select id,salary,DENSE_RANK() OVER (ORDER BY SALARY DESC) as 'Ranking_of_Salaries'
From Employee)
SELECT IFNULL(
(SELECT DISTINCT salary FROM t WHERE Ranking_of_Salaries = 2), NULL )
AS SecondHighestSalary;
