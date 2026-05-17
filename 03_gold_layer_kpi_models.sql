--STEP 6 Gold layer Business Models

-- KPI 1: EV Adoption by Manufacturer

CREATE OR REPLACE TABLE EV_ANALYTICS_DB.GOLD.EV_ADOPTION_BY_MANUFACTURER AS

WITH manufacturer_summary AS (

SELECT
    MAKE,

    COUNT(DISTINCT VIN) AS TOTAL_VEHICLES,

    COUNT(DISTINCT MODEL) AS TOTAL_MODELS,

    ROUND(
        COUNT(DISTINCT VIN) * 100.0 /
        SUM(COUNT(DISTINCT VIN)) OVER (),
        2
    ) AS MARKET_SHARE_PCT,

    SUM(
        CASE
            WHEN ELECTRIC_VEHICLE_TYPE = 'Battery Electric Vehicle (BEV)'
            THEN 1 ELSE 0
        END
    ) AS BEV_COUNT,

    SUM(
        CASE
            WHEN ELECTRIC_VEHICLE_TYPE = 'Plug-in Hybrid Electric Vehicle (PHEV)'
            THEN 1 ELSE 0
        END
    ) AS PHEV_COUNT,

    ROUND(AVG(ELECTRIC_RANGE), 2) AS AVG_ELECTRIC_RANGE,

    MIN(MODEL_YEAR) AS EARLIEST_MODEL_YEAR,

    MAX(MODEL_YEAR) AS LATEST_MODEL_YEAR,

    COUNT(DISTINCT MODEL_YEAR) AS YEARS_IN_MARKET

FROM EV_ANALYTICS_DB.SILVER.EV_POPULATION_SILVER

GROUP BY MAKE

)

SELECT
    *,

    RANK() OVER (
        ORDER BY TOTAL_VEHICLES DESC
    ) AS MANUFACTURER_RANK

FROM manufacturer_summary

ORDER BY TOTAL_VEHICLES DESC;

-- KPI 2: Average Electric Range by Make
CREATE OR REPLACE Table EV_ANALYTICS_DB.GOLD.EV_AVG_RANGE_BY_MAKE AS
SELECT
    MAKE,
    COUNT(DISTINCT VIN)                                             AS TOTAL_VEHICLES,
    COUNT(DISTINCT MODEL)                                           AS TOTAL_MODELS,
    ROUND(AVG(ELECTRIC_RANGE), 2)                                   AS AVG_ELECTRIC_RANGE,
    MIN(ELECTRIC_RANGE)                                             AS MIN_ELECTRIC_RANGE,
    MAX(ELECTRIC_RANGE)                                             AS MAX_ELECTRIC_RANGE,
    ROUND(AVG(CASE WHEN ELECTRIC_VEHICLE_TYPE = 'Battery Electric Vehicle (BEV)'
                   THEN ELECTRIC_RANGE END), 2)                     AS AVG_BEV_RANGE,
    ROUND(AVG(CASE WHEN ELECTRIC_VEHICLE_TYPE = 'Plug-in Hybrid Electric Vehicle (PHEV)'
                   THEN ELECTRIC_RANGE END), 2)                     AS AVG_PHEV_RANGE,
    SUM(CASE WHEN ELECTRIC_RANGE > 0 THEN 1 ELSE 0 END)            AS VEHICLES_WITH_RANGE_DATA,
    ROUND(SUM(CASE WHEN ELECTRIC_RANGE > 0 THEN 1 ELSE 0 END)
          * 100.0 / COUNT(*), 2)                                    AS RANGE_DATA_COVERAGE_PCT
FROM EV_ANALYTICS_DB.SILVER.EV_POPULATION_SILVER
GROUP BY MAKE
ORDER BY AVG_ELECTRIC_RANGE DESC;

select * from EV_ANALYTICS_DB.GOLD.EV_AVG_RANGE_BY_MAKE limit 10;

-- KPI 3: EV Growth by Year
CREATE OR REPLACE Table EV_ANALYTICS_DB.GOLD.EV_GROWTH_BY_YEAR AS
SELECT
    MODEL_YEAR,
     COUNT(DISTINCT VIN)                                             AS TOTAL_VEHICLES,
    COUNT(DISTINCT MAKE)                                            AS TOTAL_MAKES,
    COUNT(DISTINCT MODEL)                                           AS TOTAL_MODELS,
    SUM(CASE WHEN ELECTRIC_VEHICLE_TYPE = 'Battery Electric Vehicle (BEV)'
             THEN 1 ELSE 0 END)                                     AS BEV_COUNT,
    SUM(CASE WHEN ELECTRIC_VEHICLE_TYPE = 'Plug-in Hybrid Electric Vehicle (PHEV)'
             THEN 1 ELSE 0 END)                                     AS PHEV_COUNT,
    ROUND(AVG(ELECTRIC_RANGE), 2)                                   AS AVG_ELECTRIC_RANGE,
     LAG(COUNT(DISTINCT VIN)) OVER (ORDER BY MODEL_YEAR)             AS PREV_YEAR_VEHICLES,
    ROUND((COUNT(DISTINCT VIN) - LAG(COUNT(DISTINCT VIN)) OVER (ORDER BY MODEL_YEAR))
          * 100.0 / NULLIF(LAG(COUNT(DISTINCT VIN)) OVER (ORDER BY MODEL_YEAR), 0), 2)
                                                                    AS YOY_GROWTH_PCT,
    SUM(COUNT(DISTINCT VIN)) OVER (ORDER BY MODEL_YEAR)             AS CUMULATIVE_VEHICLES
FROM EV_ANALYTICS_DB.SILVER.EV_POPULATION_SILVER
GROUP BY MODEL_YEAR
ORDER BY MODEL_YEAR;

select * from EV_ANALYTICS_DB.GOLD.EV_GROWTH_BY_YEAR limit 10;

-- KPI 4: Utility Provider Demand
CREATE OR REPLACE Table EV_ANALYTICS_DB.GOLD.EV_UTILITY_PROVIDER_DEMAND AS
SELECT
     ELECTRIC_UTILITY,
    COUNT(DISTINCT VIN)                                             AS TOTAL_VEHICLES,
    ROUND(COUNT(DISTINCT VIN) * 100.0 /
          SUM(COUNT(DISTINCT VIN)) OVER (), 2)                      AS DEMAND_SHARE_PCT,
    COUNT(DISTINCT MAKE)                                            AS DISTINCT_MAKES,
    COUNT(DISTINCT MODEL)                                           AS DISTINCT_MODELS,
    SUM(CASE WHEN ELECTRIC_VEHICLE_TYPE = 'Battery Electric Vehicle (BEV)'
             THEN 1 ELSE 0 END)                                     AS BEV_COUNT,
    SUM(CASE WHEN ELECTRIC_VEHICLE_TYPE = 'Plug-in Hybrid Electric Vehicle (PHEV)'
             THEN 1 ELSE 0 END)                                     AS PHEV_COUNT,
    ROUND(AVG(ELECTRIC_RANGE), 2)                                   AS AVG_ELECTRIC_RANGE,
    COUNT(DISTINCT COUNTY)                                          AS COUNTIES_SERVED,
    COUNT(DISTINCT CITY)                                            AS CITIES_SERVED,
    MIN(MODEL_YEAR)                                                 AS EARLIEST_MODEL_YEAR,
    MAX(MODEL_YEAR)                                                 AS LATEST_MODEL_YEAR
FROM EV_ANALYTICS_DB.SILVER.EV_POPULATION_SILVER
WHERE ELECTRIC_UTILITY IS NOT NULL
GROUP BY ELECTRIC_UTILITY
ORDER BY TOTAL_VEHICLES DESC;

select * from EV_ANALYTICS_DB.GOLD.EV_UTILITY_PROVIDER_DEMAND limit 10;


create schema EV_ANALYTICS_DB.CORTEX_AI_ANALYTICS;
