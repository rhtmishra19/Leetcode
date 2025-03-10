-- WITH cte AS (
--     SELECT 
--         user_id, 
--         name, 
--         mail, 
--         SUBSTRING_INDEX(mail, '@', 1) AS before_at,
--         CASE 
--             WHEN SUBSTRING_INDEX(mail, '@', 1) REGEXP '^[A-Za-z][A-Za-z0-9_.-]*$' 
--             THEN 'Valid' 
--             ELSE 'Invalid' 
--         END AS email_validity
--     FROM users 
--     WHERE mail LIKE '%@leetcode.com'
-- )

-- SELECT user_id, name, mail 
-- FROM cte 
-- WHERE email_validity = 'Valid';

-- select * from Users where right(mail, 13) like "@leetcode.com" and left(mail, length(mail)-13) regexp '^[A-Za-z][A-Za-z0-9._-]*$'

-- SELECT user_id, name, mail 
-- FROM users 
-- WHERE mail LIKE '%@leetcode.com'
-- AND SUBSTRING_INDEX(mail, '@', 1) REGEXP '^[A-Za-z][A-Za-z0-9_.-]*$';

SELECT user_id, name, mail
FROM users
WHERE 
    mail REGEXP '^[A-Za-z][A-Za-z0-9._-]*@leetcode\\.com$';
