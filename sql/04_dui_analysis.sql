-- NHTSA: DUI Analysis - Drunk vs Non-Drunk Drivers (25.8% DUI)
-- From crash_pg4 table (2021 highway crashes)
SELECT 
    CASE
        WHEN number_of_drunk_drivers BETWEEN 1 AND 4 THEN 'Drunk Drivers'
        ELSE 'Not Drunk Drivers'
    END as driver_status,
    COUNT(consecutive_number) as total_crashes
FROM crash_pg4
GROUP BY 1
ORDER BY total_crashes DESC;
