-- NHTSA: Hourly Crash Patterns 2021 (Peak Hour Analysis)
-- From crash_pg4 table with timezone conversion
SELECT 
    TO_CHAR(state_timestamp_of_crash, 'HH24') as hourly_crash,
    COUNT(*) as total_crash
FROM crash_pg4
GROUP BY TO_CHAR(state_timestamp_of_crash, 'HH24')
ORDER BY total_crash DESC;