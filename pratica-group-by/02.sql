select users.id as user_id,
count("courseId") as educations
from educations
join users
on educations."userId" = users.id
group by users.id;