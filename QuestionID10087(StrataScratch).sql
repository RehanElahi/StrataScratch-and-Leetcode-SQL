-- Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

-- facebook_reactions
-- poster: int
-- friend: int
-- reaction: varchar
-- date_day: int
-- post_id: int

-- facebook_posts
-- post_id: int
-- poster: int
-- post_text: varchar
-- post_keywords: varchar
-- post_date: datetime

-- Code
select * from facebook_posts
where post_id In (
Select post_id 
from facebook_reactions
where reaction= 'heart'
);
