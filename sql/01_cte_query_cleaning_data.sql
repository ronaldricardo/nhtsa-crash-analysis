-- NHTSA 2021: Create crash_pg4 table with timezone conversion
-- Fixed syntax errors + proper PostgreSQL format
DROP TABLE IF EXISTS crash_pg4;

CREATE TABLE crash_pg4 AS
WITH cte1 AS (
    SELECT *,
        -- Convert timestamp to state timezone
        CASE
            WHEN state_name IN ('Connecticut', 'Delaware', 'Georgia', 'Maine','Maryland', 
                               'Massachusetts','Michigan','New Hampshire', 'New Jersey','New York',
                               'North Carolina','Ohio','Pennsylvania','Rhode Island','South Carolina',
                               'Vermont','Virginia', 'Washington DC', 'West Virginia','Florida',
                               'Indiana','Kentucky','Tennessee')
                THEN timestamp_of_crash AT TIME ZONE 'EST'
            WHEN state_name IN ('Alabama', 'Arkansas', 'Illinois', 'Iowa', 'Louisiana', 
                               'Michigan','Minnesota', 'Mississippi', 'Missouri','Nebraska', 
                               'Oklahoma', 'Wisconsin', 'Kansas', 'North Dakota', 'South Dakota','Texas')
                THEN timestamp_of_crash AT TIME ZONE 'CST'
            WHEN state_name IN ('Arizona','Colorado','Montana','New Mexico','Utah','Wyoming','Idaho','Oregon')
                THEN timestamp_of_crash AT TIME ZONE 'MST'
            WHEN state_name IN ('California', 'Nevada', 'Washington', 'Alaska')
                THEN timestamp_of_crash AT TIME ZONE 'PST'
            WHEN state_name IN ('Anchorage', 'Juneau', 'Nome')
                THEN timestamp_of_crash AT TIME ZONE 'YST'
            WHEN state_name IN ('Aleutian islands', 'Hawaii')
                THEN timestamp_of_crash AT TIME ZONE 'HST'
            WHEN state_name IN ('Delaware','District of Columbia', 'Georgia', 'Maryland')
                THEN timestamp_of_crash AT TIME ZONE 'AST'
        END AS state_timestamp_of_crash,
        
        -- Clean city names
        CASE
            WHEN city_name IN ('Not Reported', 'NOT APPLICABLE', 'Unknown')
                THEN 'Other'
            ELSE city_name
        END AS city_name_clean,
        
        -- Clean functional system
        CASE
            WHEN functional_system_name = 'Not Reported'
                THEN 'Unknown'
            ELSE functional_system_name
        END AS functional_system_name_clean,
        
        -- Clean land use
        CASE
            WHEN land_use_name = 'Not Reported'
                THEN 'Unknown'
            ELSE land_use_name
        END AS land_use_name_clean,
        
        -- Clean collision manner
        CASE
            WHEN manner_of_collision_name IN ('Not Reported', 'Reported as Unknown')
                THEN 'Other'
            ELSE manner_of_collision_name
        END AS manner_of_collision_name_clean,
        
        -- Clean intersection type
        CASE
            WHEN type_of_intersection_name IN ('Not Reported', 'Reported as Unknown')
                THEN 'Other Intersection Type'
            ELSE type_of_intersection_name
        END AS type_of_intersection_name_clean,
        
        -- Clean atmospheric conditions
        CASE
            WHEN atmospheric_conditions_l_name IN ('Not Reported', 'Reported as Unknown')
                THEN 'Other'
            ELSE atmospheric_conditions_l_name
        END AS atmospheric_conditions_l_name_clean,
        
        -- Clean light conditions
        CASE
            WHEN light_condition_name IN ('Not Reported', 'Reported as Unknown')
                THEN 'Other'
            ELSE light_condition_name
        END AS light_condition_name_clean
        
    FROM crash
)
SELECT * 
FROM cte1
WHERE EXTRACT(YEAR FROM state_timestamp_of_crash) = 2021;
