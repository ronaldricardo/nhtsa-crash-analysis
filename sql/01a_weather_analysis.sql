-- NHTSA: Crashes by Atmospheric Conditions (Weather)
-- From crash_pg4 table (2021 data)
SELECT 
    atmospheric_conditions_1_name_clean,
    COUNT(*) as total_crash
FROM crash_pg4
GROUP BY atmospheric_conditions_1_name_clean
ORDER BY total_crash DESC