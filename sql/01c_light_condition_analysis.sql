-- NHTSA: Crashes by Light Conditions (Day/Night)
-- From crash_pg4 table (2021 data)
SELECT 
    light_condition_name_clean,
    COUNT(*) as total_crash
FROM crash_pg4
GROUP BY light_condition_name_clean
ORDER BY total_crash DESC;

