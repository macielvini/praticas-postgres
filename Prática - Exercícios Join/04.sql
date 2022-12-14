SELECT users.id, users.name, roles.name AS "role", companies.name AS company, experiences."startDate"
FROM users
JOIN experiences
ON users.id = experiences."userId"
JOIN roles
ON experiences."roleId" = roles.id
JOIN companies
ON experiences."companyId" = companies.id
WHERE experiences."userId"=50 AND experiences."endDate" IS NULL;

-- |---id---|---name---|--------role--------|----company----|---startDate---|
--     1        João      Software Engineer        OLX          2020-06-01
--     2        João         Consultant            IBM          2022-02-01
--    ...        ...            ...                ...              ...