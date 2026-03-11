-- NHTSA: Hour 13:00 Crash Patterns (Urban/Rural + Intersection)
-- Detailed analysis for peak hour (2,166 crashes)
SELECT 
    EXTRACT(HOUR FROM state_timestamp_of_crash) as hour,
    COUNT(land_use_name_clean) as total_crash,
    COUNT(land_use_name_clean) FILTER (WHERE land_use_name_clean LIKE '%Rural%') as rural_crash,
    COUNT(land_use_name_clean) FILTER (WHERE land_use_name_clean LIKE '%Urban%') as urban_crash,
    COUNT(land_use_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Not an Intersection%') as not_intersection,
    COUNT(land_use_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Other Intersection Type%') as other_intersection,
    COUNT(land_use_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Five Point%') as five_point,
    COUNT(land_use_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Four-Way%') as four_way,
    COUNT(land_use_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Traffic Circle%') as traffic_circle,
    COUNT(land_use_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Roundabout%') as roundabout
FROM crash_pg4
WHERE EXTRACT(HOUR FROM state_timestamp_of_crash) = 13
GROUP BY EXTRACT(HOUR FROM state_timestamp_of_crash)
ORDER BY hour;

