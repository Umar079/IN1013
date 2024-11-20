-- 1
SELECT * FROM restBill WHERE cust_name = 'Bob Crow';

-- 2
SELECT DISTINCT * FROM restBill WHERE cust_name LIKE "%smith" ORDER BY cust_name DESC;

-- 3
SELECT DISTINCT cust_name FROM restBill WHERE cust_name LIKE "% C%";

-- 4
SELECT * FROM restStaff WHERE headwaiter IS NOT NULL;

-- 5
SELECT * FROM restBill WHERE bill_date LIKE '1602%';

-- 6
SELECT DISTINCT * FROM restBill WHERE bill_date LIKE '15%' ORDER BY bill_date ASC;
