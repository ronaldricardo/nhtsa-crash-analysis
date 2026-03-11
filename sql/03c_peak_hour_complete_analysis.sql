-- NHTSA: Hour 13:00 Complete Pattern Analysis
-- Urban/Rural + All Intersection Types (Peak Hour)
-- Updated: COUNT(consecutive_number) per request
SELECT 
    EXTRACT(HOUR FROM state_timestamp_of_crash) as hour,
    COUNT(consecutive_number) as total_crash,
    COUNT(land_use_name_clean) FILTER (WHERE land_use_name_clean LIKE '%Rural%') as rural_crash,
    COUNT(type_of_intersection_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Not an Intersection%') as not_intersection,
    COUNT(type_of_intersection_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Other Intersection Type%') as other_intersection,
    COUNT(type_of_intersection_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Five Point%') as five_point,
    COUNT(type_of_intersection_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Four-Way%') as four_way,
    COUNT(type_of_intersection_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Traffic Circle%') as traffic_circle,
    COUNT(type_of_intersection_name_clean) FILTER (WHERE type_of_intersection_name_clean LIKE '%Roundabout%') as roundabout
FROM crash_pg4
WHERE EXTRACT(HOUR FROM state_timestamp_of_crash) = 13
GROUP BY EXTRACT(HOUR FROM state_timestamp_of_crash)
ORDER BY hour;