CREATE OR REPLACE PROCEDURE create_gender_temp_tables()
AS $$
BEGIN
    DROP TABLE IF EXISTS temp_male;
    DROP TABLE IF EXISTS temp_female;

    CREATE TEMP TABLE temp_male AS
    SELECT * FROM employees
    WHERE gender = 'M'
    ORDER BY salary DESC;

    CREATE TEMP TABLE temp_female AS
    SELECT * FROM employees
    WHERE gender = 'F'
    ORDER BY salary DESC;
END;
$$ LANGUAGE plpgsql;
