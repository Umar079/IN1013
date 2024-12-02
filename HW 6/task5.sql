--1
SELECT rs.first_name, rs.surname, rb.bill_date, COUNT(rb.bill_no) AS number_of_bills
FROM restBill rb JOIN restStaff rs
ON rb.waiter_no = rs.staff_no
GROUP BY rs.first_name, rs.surname, rb.bill_date
HAVING COUNT(rb.bill_no) >= 2;

--2
SELECT room_name, COUNT(table_no) AS number_of_tables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name

--3
SELECT rr.room_name, SUM(rb.bill_total) AS total_bill
FROM restRest_table rr JOIN restBill rb
ON rr.table_no = rb.table_no
GROUP BY rr.room_name

--4
SELECT rs.first_name, rs.surname, SUM(rb.bill_total)
FROM restStaff rs JOIN restBill rb
ON rs.staff_no = rb.waiter_no
WHERE headwaiter IS NOT NULL
GROUP BY rs.first_name, rs.surname
ORDER BY SUM(rb.bill_total) DESC

--5
SELECT cust_name
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

--6
SELECT rs.first_name, rs.surname, COUNT(rb.bill_no) AS number_of_bills
FROM restStaff rs JOIN restBill rb
ON rs.staff_no = rb.waiter_no
GROUP BY rs.first_name, rs.surname,bill_date
HAVING COUNT(rb.bill_no) >= 3;