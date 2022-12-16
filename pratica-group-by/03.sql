select users.name as writer, count(testimonials.id) as "testimonialsCount"
from testimonials
join users
on testimonials."writerId" = users.id
where users.id=435
group by users.id;