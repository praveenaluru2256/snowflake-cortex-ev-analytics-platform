# snowflake-cortex-ev-analytics-platform

##Project Overview

Built an end-to-end AI-powered Electric Vehicle (EV) analytics platform using Snowflake, Cortex Code, SQL, and Power BI to analyze EV adoption trends, manufacturer market share, infrastructure demand, and EV performance metrics.

This project demonstrates modern analytics engineering concepts including:

Medallion architecture
Data quality engineering
KPI modeling
AI-assisted analytics workflows
Executive dashboard development
Interactive business intelligence reporting

The platform transforms raw EV population data into business-ready insights using scalable cloud-native analytics architecture.






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
