# Snowflake-cortex-ev-analytics-platform

## Project Overview

Built an end-to-end AI-powered Electric Vehicle (EV) analytics platform using Snowflake, Cortex Code, SQL, 
and Power BI to analyze EV adoption trends, manufacturer market share, infrastructure demand, and EV performance metrics.

This project demonstrates modern analytics engineering concepts including:

1. Medallion architecture
2. Data quality engineering
3. KPI modeling
4. AI-assisted analytics workflows
5. Executive dashboard development
6. Interactive business intelligence reporting

The platform transforms raw EV population data into business-ready insights using scalable cloud-native analytics architecture.


## Business Problem

Electric Vehicle adoption is growing rapidly, creating new challenges for:

1. EV manufacturers
2. Utility providers
3. Infrastructure planners
4. Government agencies
5. Market analysts

Organizations require:

1. real-time EV adoption insights,
2. manufacturer growth analysis,
3. charging infrastructure demand forecasting,
4. EV performance comparisons,
5. executive-level analytics dashboards.

This project solves those challenges using Snowflake-based analytics engineering and AI-assisted business intelligence.


## Architecture Overview

### Medallion Architecture


                     ┌─────────────────────────────┐
                    │      Vehicle Dataset        │
                    │   CSV / Raw EV Population   │
                    └──────────────┬──────────────┘
                                   │
                                   ▼
                    ┌─────────────────────────────┐
                    │        BRONZE LAYER         │
                    │   RAW_EV_POPULATION table   │
                    │  Raw ingestion into Snowflake│
                    └──────────────┬──────────────┘
                                   │
                                   ▼
                    ┌─────────────────────────────┐
                    │        SILVER LAYER         │
                    │ EV_POPULATION_SILVER        │
                    │                             │
                    │ • Duplicate removal         │
                    │ • Null handling             │
                    │ • Datatype conversion       │
                    │ • Data standardization      │
                    │ • Data quality validation   │
                    └──────────────┬──────────────┘
                                   │
                ┌──────────────────┼──────────────────┐
                │                  │                  │
                ▼                  ▼                  ▼
┌────────────────────────┐ ┌──────────────────────┐ ┌────────────────────────┐
│    GOLD LAYER          │ │   GOLD LAYER         │ │    GOLD LAYER          │
│EV_ADOPTION_BY_         │ │EV_GROWTH_BY_YEAR     │ │EV_AVG_RANGE_BY_MAKE   │
│MANUFACTURER            │ │                      │ │                        │
└────────────────────────┘ └──────────────────────┘ └────────────────────────┘
                │
                ▼
┌──────────────────────────────────────────────────────────────┐
│                  CORTEX AI ANALYTICS LAYER                  │
│                                                              │
│ • EV_FASTEST_GROWING_MANUFACTURERS                           │
│ • EV_CHARGING_INFRASTRUCTURE_NEEDS                           │
│ • EV_TYPE_RANGE_ANALYSIS                                     │
│                                                              │
│ AI-assisted business intelligence using Cortex Code          │
└──────────────────────────────┬───────────────────────────────┘
                               │
                               ▼
                ┌─────────────────────────────┐
                │      POWER BI DASHBOARD     │
                │                             │
                │ • Executive KPIs            │
                │ • Market Share Analysis     │
                │ • EV Adoption Trends        │
                │ • Infrastructure Insights   │
                │ • AI Executive Insights     │
                └─────────────────────────────┘
                
                
                
                
                

## Tech Stack     
## Category	                         |                   Technology
1. Cloud Data Warehouse	             |                  Snowflake
2. AI Engineering	                   |                   Cortex Code
3. SQL Processing	                   |                   Snowflake SQL
4. BI Dashboard	                     |                   Power BI
5. Version Control	                 |                   GitHub
6. Architecture Pattern	             |                   Medallion Architecture
7. Data Modeling	                   |                   Star Schema Inspired Modeling


## Project Workflow
## 1. Bronze Layer — Raw Data Ingestion
## Objective

Store raw EV population dataset in Snowflake.

## Key Features
   1. Raw CSV ingestion
   2. No transformations
   3. Source preservation
   4. Initial warehouse loading

## Table
   RAW_EV_POPULATION

   
## 2. Silver Layer — Data Cleaning & Transformation

## Objective

Create analytics-ready cleansed dataset.

## Data Quality Improvements
Implemented using Snowflake SQL and Cortex Code assistance:
1. Removed duplicate VIN records using ROW_NUMBER()
2. Standardized manufacturer names
3. Converted inconsistent datatypes
4. Handled missing values using COALESCE()
5. Removed invalid records
6. Improved analytical consistency

## Key Transformations
ROW_NUMBER() OVER (
    PARTITION BY VIN
    ORDER BY DOL_VEHICLE_ID DESC
)
COALESCE(ELECTRIC_RANGE, 0)

## Table
EV_POPULATION_SILVER
## 3. Gold Layer — Business KPI Modeling
## Objective

Create aggregated business-ready analytical tables.

## Gold Tables
Table	                                         Purpose
EV_ADOPTION_BY_MANUFACTURER	                   Market share and manufacturer KPIs
EV_GROWTH_BY_YEAR	                             EV adoption growth trends
EV_AVG_RANGE_BY_MAKE	                         EV performance analysis
EV_UTILITY_PROVIDER_DEMAND	                   Infrastructure demand analysis

## Business KPIs Generated
1. Total EV Vehicles
2. Manufacturer Market Share
3. BEV vs PHEV Distribution
4. Year-over-Year Growth
5. Average EV Driving Range
6. Utility Infrastructure Demand

# Cortex AI Analytics Layer

## Objective

Build AI-assisted business intelligence workflows.

### AI Analytics Tables
Table	                                    Business Use Case
EV_FASTEST_GROWING_MANUFACTURERS	        Executive growth analysis
EV_CHARGING_INFRASTRUCTURE_NEEDS	        Utility planning insights
EV_TYPE_RANGE_ANALYSIS	                  EV performance intelligence


## Cortex AI Use Cases
### Executive Reporting
Identify fastest-growing EV manufacturers and market leaders.

### Infrastructure Planning
Analyze counties requiring charging infrastructure expansion.

### Market Intelligence
Compare EV types and manufacturer performance.

## Cortex Code Usage

Used Cortex Code for:
1. SQL generation
2. Data cleansing assistance
3. KPI modeling
4. AI analytics table creation
5. Transformation optimization

### Future AI Enhancement
Architecture designed for future integration with:

SNOWFLAKE.CORTEX.COMPLETE()
for AI-generated executive summaries and intelligent business insights.

# Power BI Executive Dashboard

## Dashboard Features

### Executive KPI Cards
1. Total EV Vehicles
2. Total Manufacturers
3. Average EV Range
4. Top EV Manufacturer
   
### Interactive Analytics
1. EV adoption growth trends
2. Manufacturer market share analysis
3. BEV vs PHEV comparison
4. Dynamic slicers
5. AI-generated executive insights
   
### Dashboard Filters
1. Manufacturer
2. Model Year
3. Vehicle Type

# Data Modeling

Implemented star-schema-inspired semantic modeling in Power BI.

### Modeling Strategy
1. SILVER layer used for dynamic filtering context
2. GOLD tables used for KPI aggregation
3. Dynamic DAX measures implemented for slicer-aware analytics

## Key Power BI Features
1. Relationships
2. DAX Measures
3. Dynamic filtering
4. Conditional formatting
5. Interactive visualizations


# Key Business Insights

1. Tesla dominates EV market adoption with highest BEV penetration.
2. EV adoption accelerated significantly after 2023.
3. Urban counties show highest charging infrastructure demand.
4. Hybrid-heavy manufacturers reduce overall EV range averages.
5. Long-range BEV adoption continues increasing across manufacturers.


# Business Value Delivered

Business                                            Impact	Value
Duplicate record removal	                          Automated
Manual SQL effort reduction	                        Improved using Cortex Code
Executive reporting	                                Automated KPI dashboards
AI-assisted analytics workflows	                    Implemented
Interactive business intelligence	                  Enabled
Infrastructure planning insights	                  Delivered






















