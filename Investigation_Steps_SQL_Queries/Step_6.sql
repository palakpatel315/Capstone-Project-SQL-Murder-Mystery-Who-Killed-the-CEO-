-- 6. Combine all findings to identify the killer.

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
    WHERE k.employee_id IS NULL
      AND a.claim_time BETWEEN '2025-10-15 20:00:00' AND '2025-10-15 21:30:00'
),
suspicious_calls AS (
    SELECT DISTINCT caller_id AS employee_id
    FROM calls
    WHERE call_time BETWEEN '2025-10-15 20:45:00' AND '2025-10-15 21:05:00'
)
SELECT 
    e.employee_id,
    e.name,
    CASE WHEN v.employee_id IS NOT NULL THEN 1 ELSE 0 END AS In_CEO_Office,
    CASE WHEN f.employee_id IS NOT NULL THEN 1 ELSE 0 END AS False_Alibi,
    CASE WHEN s.employee_id IS NOT NULL THEN 1 ELSE 0 END AS Suspicious_Call,
    (CASE WHEN v.employee_id IS NOT NULL THEN 1 ELSE 0 END +
     CASE WHEN f.employee_id IS NOT NULL THEN 1 ELSE 0 END +
     CASE WHEN s.employee_id IS NOT NULL THEN 1 ELSE 0 END) AS Match_Count
FROM employees e
LEFT JOIN ceo_office_visitors v ON e.employee_id = v.employee_id
LEFT JOIN false_alibis f ON e.employee_id = f.employee_id
LEFT JOIN suspicious_calls s ON e.employee_id = s.employee_id
ORDER BY Match_Count DESC, e.name;
