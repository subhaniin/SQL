--transaction control language
set autocommit off;

BEGIN;

UPDATE employees
SET salary = salary + 1000
WHERE dept_id = 5;

-- If issue found:
ROLLBACK;

-- If correct:
COMMIT;
