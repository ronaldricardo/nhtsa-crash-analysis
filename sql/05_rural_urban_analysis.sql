-- NHTSA: Rural vs Urban Highway Crashes 2021 (57.5% Urban)
-- From crash_pg4 table
SELECT 
    land_use_name_clean,
    COUNT(consecutive_number) AS number_crash
FROM crash_pg4
WHERE land_use_name_clean IN ('Rural', 'Urban')
GROUP BY land_use_name_clean
ORDER BY number_crash DESC;
