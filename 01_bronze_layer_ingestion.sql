--STEP 1 — Create Snowflake Objects

--1. Create Database
create database ev_analytics_db;

--2.Create SCHEMAS
create schema ev_analytics_db.raw;
create schema ev_analytics_db.silver;
create schema ev_analytics_db.gold;

--3.Create Warehouse
create warehouse ev_wh
with warehouse_size='XSMALL'
auto_suspend=60
auto_resume=true;

--4 Use Warehouse
use warehouse ev_wh;

--5 use database
Use Database ev_analytics_db;

--6 use schema
use schema raw;

--STEP 2 — Create Stage
create or replace stage ev_stage;

--STEP 3 - Create Raw Table
create or replace table ev_analytics_db.raw.ev_population_raw (
    vin string,
    county string,
    city string,
    state string,
    postal_code float,
    model_year integer,
    make string,
    model string,
    electric_vehicle_type string,
    cafv_eligibility string,
    electric_range float,
    base_msrp float,
    legislative_district float,
    dol_vehicle_id number,
    vehicle_location string,
    electric_utility string,
    census_tract float
);

--STEP 4 - Load Data from stage to raw table
copy into ev_analytics_db.raw.ev_population_raw
from @ev_stage/Electric_Vehicle_Population_Data.csv
file_format = (
    type = csv
    skip_header = 1
    field_optionally_enclosed_by='"'
);

select * from ev_analytics_db.raw.ev_population_raw limit 5;
select count(*) from ev_analytics_db.raw.ev_population_raw;