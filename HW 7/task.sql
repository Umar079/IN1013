-- 1
CREATE VIEW samsBills AS
SELECT rs.first_name, rs.surname, rb.bill_date, rb.cust_name, rb.bill_total
FROM restBill rb
JOIN restStaff rs
ON rb.waiter_no = rs.staff_no
WHERE rs.first_name = 'Sam' AND rs.surname = 'Pitt';

-- 2
SELECT first_name, surname, bill_date, cust_name, bill_total
FROM samsBills
WHERE bill_total > 400;

-- 3
CREATE VIEW roomTotals AS
SELECT rr.room_name, SUM(rb.bill_total) AS total_sum
FROM restRest_table rr
JOIN restBill rb
ON rr.table_no = rb.table_no
GROUP BY rr.room_name;

-- 4
CREATE VIEW teamTotals AS
SELECT CONCAT(hs.first_name, ' ', hs.surname) AS headwaiter_name, SUM(rb.bill_total) AS total_sum
FROM restStaff hs
JOIN restStaff rs
ON hs.staff_no = rs.headwaiter
JOIN restBill rb
ON rs.staff_no = rb.waiter_no
GROUP BY hs.staff_no, hs.first_name, hs.surname;
