-- 2. Analyze who accessed critical areas at the time.

SELECT *
FROM (
  SELECT k.employee_id, e.name, k.entry_time, k.exit_time
  FROM keycard_logs k
  JOIN employees e ON k.employee_id = e.employee_id
  WHERE k.room = 'CEO Office'
    AND k.entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05'
  ORDER BY k.entry_time DESC
) t
LIMIT 1;