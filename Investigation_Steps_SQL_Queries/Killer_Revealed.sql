-- A final “Case Solved” query that reveals the killer.

WITH ceo_office_visitors AS (
    SELECT DISTINCT employee_id
    FROM keycard_logs
    WHERE room = 'CEO Office'
      AND entry_time BETWEEN '2025-10-15 20:30:00' AND '2025-10-15 21:15:00'
),
false_alibis AS (
    SELECT a.employee_id
    FROM alibis a
    LEFT JOIN keycard_logs k
      ON a.employee_id = k.employee_id
     AND k.entry_time <= a.claim_time
      AND k.exit_time >= a.claim_time
    WHERE a.claim_time BETWEEN '2025-10-15 20:00:00' AND '2025-10-15 21:30:00' 
    
),
suspicious_calls AS (
    SELECT DISTINCT caller_id AS employee_id
    FROM calls
    WHERE call_time BETWEEN '2025-10-15 20:45:00' AND '2025-10-15 21:05:00'
)
SELECT e.name AS killer
FROM employees e
WHERE e.employee_id IN (SELECT employee_id FROM ceo_office_visitors)
  AND e.employee_id IN (SELECT employee_id FROM false_alibis)
  AND e.employee_id IN (SELECT employee_id FROM suspicious_calls);
