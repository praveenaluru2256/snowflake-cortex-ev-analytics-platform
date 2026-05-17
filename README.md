# snowflake-cortex-ev-analytics-platform

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


#### Business Problem

Electric Vehicle adoption is growing rapidly, creating new challenges for:

EV manufacturers
Utility providers
Infrastructure planners
Government agencies
Market analysts

Organizations require:

real-time EV adoption insights,
manufacturer growth analysis,
charging infrastructure demand forecasting,
EV performance comparisons,
executive-level analytics dashboards.

This project solves those challenges using Snowflake-based analytics engineering and AI-assisted business intelligence.


Architecture Overview
Medallion Architecture


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
                
                
                
                
                Tech Stack
Category	Technology
Cloud Data Warehouse	Snowflake
AI Engineering	Cortex Code
SQL Processing	Snowflake SQL
BI Dashboard	Power BI
Version Control	GitHub
Architecture Pattern	Medallion Architecture
Data Modeling	Star Schema Inspired Modeling
Project Workflow
1. Bronze Layer — Raw Data Ingestion
Objective

Store raw EV population dataset in Snowflake.

Key Features
Raw CSV ingestion
No transformations
Source preservation
Initial warehouse loading
Table
RAW_EV_POPULATION
2. Silver Layer — Data Cleaning & Transformation
Objective

Create analytics-ready cleansed dataset.

Data Quality Improvements

Implemented using Snowflake SQL and Cortex Code assistance:

Removed duplicate VIN records using ROW_NUMBER()
Standardized manufacturer names
Converted inconsistent datatypes
Handled missing values using COALESCE()
Removed invalid records
Improved analytical consistency
Key Transformations
ROW_NUMBER() OVER (
    PARTITION BY VIN
    ORDER BY DOL_VEHICLE_ID DESC
)
COALESCE(ELECTRIC_RANGE, 0)
Table
EV_POPULATION_SILVER
3. Gold Layer — Business KPI Modeling
Objective

Create aggregated business-ready analytical tables.

Gold Tables
Table	Purpose
EV_ADOPTION_BY_MANUFACTURER	Market share and manufacturer KPIs
EV_GROWTH_BY_YEAR	EV adoption growth trends
EV_AVG_RANGE_BY_MAKE	EV performance analysis
EV_UTILITY_PROVIDER_DEMAND	Infrastructure demand analysis
Business KPIs Generated
Total EV Vehicles
Manufacturer Market Share
BEV vs PHEV Distribution
Year-over-Year Growth
Average EV Driving Range
Utility Infrastructure Demand
Cortex AI Analytics Layer
Objective

Build AI-assisted business intelligence workflows.

AI Analytics Tables
Table	Business Use Case
EV_FASTEST_GROWING_MANUFACTURERS	Executive growth analysis
EV_CHARGING_INFRASTRUCTURE_NEEDS	Utility planning insights
EV_TYPE_RANGE_ANALYSIS	EV performance intelligence
Cortex AI Use Cases
Executive Reporting

Identify fastest-growing EV manufacturers and market leaders.

Infrastructure Planning

Analyze counties requiring charging infrastructure expansion.

Market Intelligence

Compare EV types and manufacturer performance.

Cortex Code Usage

Used Cortex Code for:

SQL generation
Data cleansing assistance
KPI modeling
AI analytics table creation
Transformation optimization
Future AI Enhancement

Architecture designed for future integration with:

SNOWFLAKE.CORTEX.COMPLETE()

for AI-generated executive summaries and intelligent business insights.

Power BI Executive Dashboard
Dashboard Features
Executive KPI Cards
Total EV Vehicles
Total Manufacturers
Average EV Range
Top EV Manufacturer
Interactive Analytics
EV adoption growth trends
Manufacturer market share analysis
BEV vs PHEV comparison
Dynamic slicers
AI-generated executive insights
Dashboard Filters
Manufacturer
Model Year
Vehicle Type
Data Modeling

Implemented star-schema-inspired semantic modeling in Power BI.

Modeling Strategy
SILVER layer used for dynamic filtering context
GOLD tables used for KPI aggregation
Dynamic DAX measures implemented for slicer-aware analytics
Key Power BI Features
Relationships
DAX Measures
Dynamic filtering
Conditional formatting
Interactive visualizations
Key Business Insights
Tesla dominates EV market adoption with highest BEV penetration.
EV adoption accelerated significantly after 2023.
Urban counties show highest charging infrastructure demand.
Hybrid-heavy manufacturers reduce overall EV range averages.
Long-range BEV adoption continues increasing across manufacturers.
Business Value Delivered
Business Impact	Value
Duplicate record removal	Automated
Manual SQL effort reduction	Improved using Cortex Code
Executive reporting	Automated KPI dashboards
AI-assisted analytics workflows	Implemented
Interactive business intelligence	Enabled
Infrastructure planning insights	Delivered






















