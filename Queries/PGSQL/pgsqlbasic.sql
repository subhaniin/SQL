SELECT * FROM demo_table;

ALTER TABLE "Demo table"
ALTER COLUMN name TYPE text,
ALTER COLUMN gender TYPE text,
ALTER COLUMN "Name" TYPE text;

ALTER TABLE "Demo table" RENAME COLUMN "Citizen_id" TO citizen_id;
ALTER TABLE "Demo table" RENAME TO demo_table;


UPDATE "Demo table"
SET 
  name = CASE 
           WHEN "Citizen_id" = 1 THEN 'Subhan'
           WHEN "Citizen_id" = 2 THEN 'ansar'
         END,
  gender = CASE 
             WHEN "Citizen_id" = 1 THEN 'male'
             WHEN "Citizen_id" = 2 THEN 'male'
           END,
  "Name" = CASE 
             WHEN "Citizen_id" = 1 THEN 'shaik'
             WHEN "Citizen_id" = 2 THEN 'shaik'
           END
WHERE "Citizen_id" IN (1, 2);

