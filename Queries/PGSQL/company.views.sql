CREATE or replace VIEW employee_name AS
SELECT
  e.emp_name,
  ep.first_name,
  ep.last_name
FROM
  employees e
  JOIN employee_pd ep ON e.emp_id = ep.emp_id;