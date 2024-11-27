
-- 1
SELECT restStaff.first_name
FROM restStaff INNER JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
AND cust_name = 'Tanya Singh';


-- 2
SELECT room_date
FROM restRoom_management INNER JOIN restStaff
ON restRoom_management.headwaiter = restStaff.staff_no
WHERE restStaff.first_name = 'Charles'
  AND restStaff.surname = 'Watson'
  AND restRoom_management.room_name = 'Green'
  AND restRoom_management.room_date BETWEEN 160201 AND 160229;


-- 3
SELECT first_name, surname
FROM restStaff
WHERE headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4
SELECT cust_name, bill_total, restStaff.first_name
FROM restBill INNER JOIN restStaff
ON restBill.waiter_no = restStaff.staff_no
ORDER BY bill_total DESC;

-- 5
SELECT DISTINCT rs.first_name, rs.surname
FROM restStaff rs INNER JOIN restBill rb 
ON rs.staff_no = rb.waiter_no
WHERE rb.table_no IN (
    SELECT DISTINCT table_no
    FROM restBill
    WHERE bill_no IN (14, 17)
);

-- 6
SELECT DISTINCT rs.first_name, rs.surname
FROM restStaff rs
WHERE rs.staff_no IN (
    -- Include the headwaiter assigned to the room
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
    
    UNION
    
    -- Include all waiters in the team led by the headwaiter
    SELECT staff_no
    FROM restStaff
    WHERE headwaiter IN (
        SELECT headwaiter
        FROM restRoom_management
        WHERE room_name = 'Blue' AND room_date = 160312
    )
);


