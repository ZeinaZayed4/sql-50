-- Write your PostgreSQL query statement below
SELECT
    e.machine_id,
    ROUND(AVG(e.timestamp - s.timestamp)::numeric, 3) AS processing_time
FROM Activity e
JOIN Activity s
    ON s.activity_type = 'start'
    AND e.activity_type = 'end'
    AND e.machine_id = s.machine_id
    AND e.process_id = s.process_id
GROUP BY e.machine_id;
