CREATE OR REPLACE PROCEDURE recreate_and_load_associates()
LANGUAGE plpgsql
AS $$
BEGIN
    -- 1. Drop table if exists
    EXECUTE 'DROP TABLE IF EXISTS associates';

    -- 2. Create associates table
    EXECUTE '
        CREATE TABLE associates (
            emp_id   INT PRIMARY KEY,
            emp_name VARCHAR(30) NOT NULL,
            salary   INT CHECK (salary >= 0),
            age      INT CHECK (age > 0),
            gender   CHAR(1) CHECK (gender IN (''M'', ''F'')),
            role     VARCHAR(30)
        )
    ';

    -- 3. Insert non-manager employees
    EXECUTE '
        INSERT INTO associates (emp_id, emp_name, salary, age, gender, role)
        SELECT emp_id, emp_name, salary, age, gender, role
        FROM employees
        WHERE mngr_id IS NOT NULL
    ';
END;
$$;
