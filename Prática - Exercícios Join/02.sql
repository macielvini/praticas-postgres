SELECT testimonials.id, users.name AS writer, u.name AS recipient, testimonials.message
FROM testimonials JOIN users
ON testimonials."writerId" = users.id
JOIN users u
ON testimonials."recipientId" = u.id;