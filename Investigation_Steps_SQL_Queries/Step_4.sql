-- 4. Investigate suspicious calls made around the time 

SELECT c.call_id, c.caller_id, e1.name AS caller_name,
       c.receiver_id, e2.name AS receiver_name,
       c.call_time, c.duration_sec
FROM calls c
LEFT JOIN employees e1 ON c.caller_id = e1.employee_id
LEFT JOIN employees e2 ON c.receiver_id = e2.employee_id
WHERE c.call_time BETWEEN '2025-10-15 20:30:00' AND '2025-10-15 21:05:00'
ORDER BY c.call_time;
