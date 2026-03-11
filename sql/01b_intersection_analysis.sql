-- NHTSA: Crashes by Intersection Type
-- From crash_pg4 table (2021 data)
SELECT 
    type_of_intersection_name_clean,
    COUNT(*) as total_crash
FROM crash_pg4
GROUP BY type_of_intersection_name_clean
ORDER BY total_crash DESC;

