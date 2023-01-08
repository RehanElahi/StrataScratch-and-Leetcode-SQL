-- Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. 
-- Output a list of user_ids of these returning active users.

-- amazon_transactions:
-- id: int
-- user_id: int
-- item: varchar
-- created_at: datetime
-- revenue: int

-- Code
with t1 as 
(Select *, lead(created_at) OVER (Partition by user_id Order by created_at) as f
from amazon_transactions
),

t2 as (
Select user_id, datediff(f,created_at) as e
from t1
)

select user_id 
from t2
where e<8
group by user_id;
