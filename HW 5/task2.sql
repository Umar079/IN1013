
-- 1
SELECT SUM(bill_total) as "Income" FROM restBill;

-- 2
SELECT SUM(bill_total) as "Feb Income" FROM restBill WHERE bill_date LIKE '16%';

-- 3
SELECT AVG(bill_total) FROM restBill WHERE table_no = '2';

-- 4
SELECT MIN(no_of_seats) as 'MIN', MAX(no_of_seats) as 'MAX', AVG(no_of_seats) as 'AVG' FROM restRest_table WHERE
room_name = 'Blue';

-- 5
SELECT COUNT(DISTINCT (table_no)) FROM restBill WHERE waiter_no = '004' OR '002';
