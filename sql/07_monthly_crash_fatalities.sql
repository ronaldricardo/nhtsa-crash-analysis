-- NHTSA: Monthly Crashes & Fatalities 2021 (Q4 Peak)
-- Crashes vs Fatalities trend analysis
SELECT 
    TO_CHAR(state_timestamp_of_crash, 'Month') as month_crash,
    COUNT(consecutive_number) as total_crash,
    SUM(number_of_fatalities) as total_fatalities
FROM crash_pg4
GROUP BY TO_CHAR(state_timestamp_of_crash, 'Month')
ORDER BY month_crash;
