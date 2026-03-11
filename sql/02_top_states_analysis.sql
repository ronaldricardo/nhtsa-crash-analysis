-- NHTSA: Top 10 States by Highway Crashes 2021
-- From crash_pg4 table
SELECT 
    state_name,
    COUNT(*) as number_crash
FROM crash_pg4
GROUP BY state_name 
ORDER BY number_crash DESC 
LIMIT 10;

