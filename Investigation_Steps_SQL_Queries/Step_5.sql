-- 5. Match evidence with movements and claims.

SELECT 
    emp.name AS employee_name,
    k.room AS actual_room,
    k.entry_time AS actual_entry_time,
    a.claimed_location,
    a.claim_time,
    ev.description AS evidence_found
FROM employees emp
LEFT JOIN keycard_logs k 
    ON emp.employee_id = k.employee_id
LEFT JOIN alibis a
    ON emp.employee_id = a.employee_id
LEFT JOIN evidence ev
    ON k.room = ev.room
WHERE  k.entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05'  
ORDER BY emp.name;
