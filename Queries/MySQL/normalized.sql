CREATE TABLE NormalizedAddress (
  ID INT PRIMARY KEY,
  house_no VARCHAR(50),
  street VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  pincode VARCHAR(10)
);

INSERT INTO NormalizedAddress (ID, house_no, street, city, state, pincode)
SELECT 
  ID,
  TRIM(SUBSTRING_INDEX(address, ',', 1)),
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 2), ',', -1)),
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 3), ',', -1)),
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(address, ',', 4), ',', -1)),
  TRIM(SUBSTRING_INDEX(address, ',', -1))
FROM demotable;

select * from NormalizedAddress