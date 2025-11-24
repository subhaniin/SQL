-- 1. create schema (optional) and audit table
CREATE SCHEMA IF NOT EXISTS audit;

CREATE TABLE IF NOT EXISTS audit.audit_logs (
  id bigserial PRIMARY KEY,
  table_name text NOT NULL,
  operation text NOT NULL,          -- INSERT / UPDATE / DELETE
  changed_by text,                  -- username provided by app (nullable)
  changed_at timestamptz NOT NULL DEFAULT now(),
  pk_value text,                    -- string representation of primary key (emp_id)
  row_old jsonb,                    -- old row (for UPDATE/DELETE)
  row_new jsonb,                    -- new row (for INSERT/UPDATE)
  sql_query text,                   -- optional: store query text if you want
  extra jsonb                       -- reserved for future details
);

-- 2. create trigger function for employees table
CREATE OR REPLACE FUNCTION audit.fn_audit_employees()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_user text;
  v_pk text;
BEGIN
  -- Try reading a session-scoped audit user. If not set, NULL
  v_user := current_setting('audit.username', true);

  -- Extract primary key value (employees uses emp_id)
  IF TG_OP = 'INSERT' THEN
    v_pk := COALESCE( (row_to_json(NEW)->>'emp_id'), NULL );
    INSERT INTO audit.audit_logs(table_name, operation, changed_by, changed_at, pk_value, row_old, row_new)
    VALUES (TG_TABLE_NAME, TG_OP, v_user, now(), v_pk, NULL, row_to_json(NEW)::jsonb);
    RETURN NEW;
  ELSIF TG_OP = 'UPDATE' THEN
    v_pk := COALESCE( (row_to_json(NEW)->>'emp_id'), (row_to_json(OLD)->>'emp_id') );
    INSERT INTO audit.audit_logs(table_name, operation, changed_by, changed_at, pk_value, row_old, row_new)
    VALUES (TG_TABLE_NAME, TG_OP, v_user, now(), v_pk, row_to_json(OLD)::jsonb, row_to_json(NEW)::jsonb);
    RETURN NEW;
  ELSIF TG_OP = 'DELETE' THEN
    v_pk := COALESCE( (row_to_json(OLD)->>'emp_id'), NULL );
    INSERT INTO audit.audit_logs(table_name, operation, changed_by, changed_at, pk_value, row_old, row_new)
    VALUES (TG_TABLE_NAME, TG_OP, v_user, now(), v_pk, row_to_json(OLD)::jsonb, NULL);
    RETURN OLD;
  END IF;
END;
$$;

-- 3. attach the trigger to the employees table
DROP TRIGGER IF EXISTS employees_audit_trig ON public.employees;
CREATE TRIGGER employees_audit_trig
AFTER INSERT OR UPDATE OR DELETE ON public.employees
FOR EACH ROW EXECUTE FUNCTION audit.fn_audit_employees();
