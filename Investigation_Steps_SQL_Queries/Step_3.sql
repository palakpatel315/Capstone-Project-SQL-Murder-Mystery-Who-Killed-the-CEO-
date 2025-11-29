-- 3. Cross-check alibis with actual logs

SELECT a.employee_id, e.name,
       a.claimed_location, a.claim_time,
       k.room AS actual_room, k.entry_time, k.exit_time
FROM alibis a
LEFT JOIN employees e ON a.employee_id = e.employee_id
LEFT JOIN keycard_logs k
  ON a.employee_id = k.employee_id
  AND k.entry_time <= a.claim_time
  AND k.exit_time >= a.claim_time
WHERE a.claim_time BETWEEN '2025-10-15 20:00:00' AND '2025-10-15 21:30:00';
