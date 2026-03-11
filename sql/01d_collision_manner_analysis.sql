-- NHTSA: Crashes by Manner of Collision
-- From crash_pg4 table (2021 data)
SELECT 
    manner_of_collision_name_clean,
    COUNT(*) as total_crash
FROM crash_pg4
GROUP BY manner_of_collision_name_clean
ORDER BY total_crash DESC;
