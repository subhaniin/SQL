DROP TABLE IF EXISTS performance;

CREATE TABLE performance (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30) NOT NULL,
    old_salary INT NOT NULL CHECK (old_salary >= 0),
    grade CHAR(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'E')),
    promotion BOOLEAN DEFAULT FALSE,
    hike FLOAT CHECK (hike IS NULL OR (hike >= 0 AND hike <= 100)),
    new_salary INT CHECK (new_salary >= 0),
    joining_date DATE,
    critical_resource BOOLEAN DEFAULT FALSE,
    department VARCHAR(50),
    manager_id INT,
    performance_notes TEXT,
    last_promotion_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from performance;

INSERT INTO performance (emp_id, emp_name, old_salary, grade, promotion, hike, new_salary, critical_resource)
SELECT emp_id, emp_name, salary, null, false, NULL, NULL, false
FROM employees;

UPDATE performance
SET joining_date = '2025-01-01';