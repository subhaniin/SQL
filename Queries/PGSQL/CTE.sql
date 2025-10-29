WITH dept_avg AS (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
)
SELECT dept_id, avg_salary
FROM dept_avg
WHERE avg_salary > 70000;

WITH RECURSIVE numbers AS (
    -- Anchor: start with 1
    SELECT 1 AS num

    UNION ALL

    -- Recursive: add 1 each time
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT * FROM numbers;

WITH RECURSIVE clanker AS (
    SELECT 'CLANK' AS sound, 1 AS num
    UNION ALL
    SELECT 'CLANK', num + 1
    FROM clanker
    WHERE num < 10
)
SELECT * FROM clanker;
