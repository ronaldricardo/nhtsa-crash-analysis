-- NHTSA: Daily Crash Patterns 2021 (Sunday Peak)
-- Weekend analysis from crash_pg4 table
WITH daily_crash AS (
    SELECT 
        TO_CHAR(state_timestamp_of_crash, 'Day') as days,
        COUNT(consecutive_number) as total_crash
    FROM crash_pg4
    GROUP BY TO_CHAR(state_timestamp_of_crash, 'Day')
)
SELECT 
    *,
    CASE
        WHEN days LIKE '%Sunday%' THEN 1
        WHEN days LIKE '%Monday%' THEN 2
        WHEN days LIKE '%Tuesday%' THEN 3
        WHEN days LIKE '%Wednesday%' THEN 4
        WHEN days LIKE '%Thursday%' THEN 5
        WHEN days LIKE '%Friday%' THEN 6
        WHEN days LIKE '%Saturday%' THEN 7
    END as days_rank
FROM daily_crash
ORDER BY days_rank ASC;