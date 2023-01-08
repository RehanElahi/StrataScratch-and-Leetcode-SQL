-- Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table indicates the name and the ID of a student.
-- id is a continuous increment.
 

-- Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
-- Return the result table ordered by id in ascending order.

-- Code
WITH t as(
Select *, lead(student) Over (order by id) as 'LeadStud', lag(student) over (Order by id) as 'lagstud'
from seat
)
select id, case when mod(id,2)!=0 AND LeadStud IS NULL then student                
when mod(id,2)!=0 then LeadStud
else lagstud end as 'student'
from t
