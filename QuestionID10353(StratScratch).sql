-- Find the titles of workers that earn the highest salary. Output the highest-paid title or multiple titles that share the highest salary.

-- worker:
-- worker_id: int
-- first_name: varchar
-- last_name: varchar
-- salary: int
-- joining_date: datetime
-- department: varchar

-- title:
-- worker_ref_id: int
-- worker_title: varchar
-- affected_from: datetime



-- Code
-- Using subqueries
Select worker_title
from title
where worker_ref_id IN
(Select worker_id 
from worker
where salary IN
(Select MAX(salary)
from worker 
))

-- Using CTE and Join
With t as (SELECT a.salary, b.worker_title
FROM worker a
INNER JOIN title b
ON a.worker_id=b.worker_ref_id)

Select worker_title
FROM t
where salary = (Select MAX(salary) from t);
