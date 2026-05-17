--STEP 5 Silver layer transformation
CREATE OR REPLACE TABLE EV_ANALYTICS_DB.SILVER.EV_POPULATION_SILVER AS
WITH deduplicated as (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY VIN
            ORDER BY DOL_VEHICLE_ID DESC
        ) AS rn
    FROM EV_ANALYTICS_DB.RAW.EV_POPULATION_RAW
)
SELECT
    VIN::VARCHAR(10)                                        AS VIN,
    COUNTY::VARCHAR(100)                                    AS COUNTY,
    CITY::VARCHAR(100)                                      AS CITY,
    STATE::VARCHAR(2)                                       AS STATE,
    COALESCE(POSTAL_CODE::INTEGER, 0)                       AS POSTAL_CODE,
    MODEL_YEAR::INTEGER                                     AS MODEL_YEAR,
    UPPER(TRIM(MAKE))::VARCHAR(100)                         AS MAKE,
    UPPER(TRIM(MODEL))::VARCHAR(100)                        AS MODEL,
    ELECTRIC_VEHICLE_TYPE::VARCHAR(50)                       AS ELECTRIC_VEHICLE_TYPE,
    CAFV_ELIGIBILITY::VARCHAR(100)                           AS CAFV_ELIGIBILITY,
    COALESCE(ELECTRIC_RANGE, 0)::INTEGER                    AS ELECTRIC_RANGE,
    BASE_MSRP::INTEGER                                      AS BASE_MSRP,
    LEGISLATIVE_DISTRICT::INTEGER                           AS LEGISLATIVE_DISTRICT,
    DOL_VEHICLE_ID::INTEGER                                 AS DOL_VEHICLE_ID,
    VEHICLE_LOCATION::VARCHAR(200)                          AS VEHICLE_LOCATION,
    ELECTRIC_UTILITY::VARCHAR(200)                          AS ELECTRIC_UTILITY,
    CENSUS_TRACT::BIGINT                                    AS CENSUS_TRACT
FROM deduplicated
WHERE rn = 1
  AND BASE_MSRP >= 0
  AND BASE_MSRP IS NOT NULL;

select count(*) from ev_analytics_db.silver.ev_population_silver;

select * from ev_analytics_db.raw.ev_population_raw limit 10;