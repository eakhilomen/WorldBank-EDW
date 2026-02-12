# WorldBank-EDW  
## Banking-Style Macroeconomic Risk Data Warehouse (SQL Server + Power BI)

---

## 📌 Project Objective

This project builds a banking-style Enterprise Data Warehouse (EDW) using macroeconomic data from the World Bank World Development Indicators (WDI).

The objective is to simulate how financial institutions monitor country-level macroeconomic risk signals to support:

- Credit risk assessment
- Geographic exposure analysis
- Portfolio strategy
- Capital allocation decisions

---

## 🌍 Data Source

World Bank – World Development Indicators (WDI)  
https://databank.worldbank.org/source/world-development-indicators

Data was downloaded as CSV files directly from the WDI DataBank interface.

Selected Indicators:

- GDP growth (annual %)
- Inflation, consumer prices (annual %)
- Unemployment, total (% of labor force)
- Official exchange rate (LCU per US$)
- Lending interest rate (%)
- Population, total

Time Period: 2000–2024  
Countries: 226 global economies

Raw dataset stored as:

datasets/raw/wdi_macro_raw.csv

---

## 🏗 Architecture (Bronze → Silver → Gold)

### 🥉 Bronze Layer

Raw CSV file loaded into SQL Server without transformation.

Table:
bronze_wdi_raw

Structure:
- Country Name
- Country Code
- Series Name
- Series Code
- 2000–2024 year columns

Purpose:
- Preserve raw source data
- Enable data lineage
- Maintain reproducibility

---

### 🥈 Silver Layer

Data normalized using SQL UNPIVOT operation.

Wide format converted into long format:

| country_name | country_code | series_name | series_code | year | indicator_value |

Transformations performed:
- UNPIVOT year columns into rows
- Data type standardization
- Removal of null values
- Year conversion to INT
- Indicator value conversion to DECIMAL

Table:
silver_wdi_macro

---

### 🥇 Gold Layer (Star Schema)

Dimensions:
- dim_country
- dim_indicator
- dim_date

Fact:
- fact_macro

Advanced Analytical Mart:
- fact_risk_index (composite macroeconomic risk score)

This layer supports optimized analytical queries and Power BI reporting.

---

## 📊 Banking Risk Index Model

A composite macroeconomic risk index was constructed using weighted indicators:

- Inflation (30%)
- Unemployment (25%)
- GDP Growth (25%)
- Exchange Rate Volatility (20%)

The index enables identification of high-risk macro environments across countries and time.

---

## 📈 Power BI Dashboard Pages

1. Executive Macro Risk Overview
2. Country Risk Profile (Drillthrough)
3. Indicator Deep Dive
4. Regional Comparison
5. Shock Analysis (2008 Financial Crisis & COVID-19)

---

## 🛠 Tools Used

- SQL Server (Bronze-Silver-Gold Architecture)
- T-SQL (UNPIVOT & Star Schema Modeling)
- Power BI
- GitHub
- World Bank WDI API / CSV Extract

---

## 💡 Business Value

This project demonstrates how a financial institution can:

- Monitor macroeconomic deterioration
- Identify country-level systemic risk
- Compare economic stability across regions
- Support lending strategy and capital allocation

