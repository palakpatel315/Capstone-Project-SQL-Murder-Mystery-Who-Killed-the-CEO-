-- 1. Identify where and when the crime happened.

SELECT room AS Crime_Location,
       entry_time AS Crime_Time
FROM keycard_logs
WHERE room = 'CEO Office'
AND entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:05';       
