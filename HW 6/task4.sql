-- 1
SELECT DISTINCT rb.cust_name
FROM restBill rb JOIN restRest_table rt
ON rb.table_no = rt.table_no
WHERE rb.bill_total > 450.00
AND rt.room_name IN (
    SELECT rm.room_name
    FROM restRoom_management rm JOIN restStaff rs
    ON rm.headwaiter = rs.staff_no
    WHERE rs.first_name = 'Charles'
    AND rm.room_date = rb.bill_date
);

--2
SELECT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.staff_no = (
    SELECT rm.headwaiter
    FROM restRoom_management rm
    JOIN restRest_table rt
    ON rm.room_name = rt.room_name
    WHERE rt.table_no = (
        SELECT rb.table_no
        FROM restBill rb
        WHERE rb.cust_name = 'Nerida'
        AND rb.bill_date = 160111
    )
    AND rm.room_date = 160111
);

--3
SELECT cust_name
FROM restBill
WHERE bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

--4
SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);

--5
SELECT DISTINCT rb.cust_name, rs.first_name, rs.surname, rm.room_name
FROM restBill rb JOIN restStaff rs
ON rb.waiter_no = rs.staff_no
JOIN restRoom_management rm
ON rb.bill_date = rm.room_date
WHERE bill_total = (SELECT max(bill_total) FROM restBill);
