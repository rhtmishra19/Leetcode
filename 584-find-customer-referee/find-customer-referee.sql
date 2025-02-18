# Write your MySQL query statement below
SELECT c1.name
FROM Customer c1
WHERE NOT EXISTS (
    SELECT 1 FROM Customer c2
    WHERE c1.id = c2.id AND c2.referee_id = 2
);
