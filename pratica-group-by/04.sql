select max(jobs.salary) as maximum_salary, roles.name as role
from jobs
join roles
on jobs."roleId" = roles.id
where active=true
group by roles.name
order by maximum_salary desc;