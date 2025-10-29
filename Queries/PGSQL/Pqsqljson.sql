SELECT json_agg(t)
FROM employees t;

SELECT json_agg(t)::text
FROM employees t;
