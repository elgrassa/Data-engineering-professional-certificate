## Overview
This project explores Poland's real estate market, focusing on rental and sales data across cities.
The goal is to identify trends, such as price changes and market activity,
using an interactive Streamlit dashboard for analysis and visualization.  

**Note:** For some cities with smaller real estate markets, such as Bydgoszcz, Gdynia, and Szczecin, the available data is limited. As a result, you may encounter missing or incomplete data, or differences in visualizations for these cities due to their smaller market activity.

## Accessible via
https://polish-flats-ps.streamlit.app/
![img.png](img.png)

**Tools & Technologies**
### 1. Docker Compose & PostgreSQL
**Purpose**: Set up a local database to store and manage real estate data.  
**Command**:
   ```bash
   docker-compose -p kestra-postgres up -d
   ```

### 2. DBT (Data Build Tool)
   Purpose: Transform raw data into structured formats for analysis.
   ```bash
   pip install dbt-bigquery
   ```
### 3. Kestra
   Used to merge and aggregate 16 csv files from folder kestra/csv for rent and sale date 
   from [dataset](https://www.kaggle.com/datasets/krzysztofjamroz/apartment-prices-in-poland):

![img_1.png](img_1.png)

**Purpose:**
Automate data pipelines for extracting, transforming, and loading (ETL) data into PostgreSQL and BigQuery.
NOTE: The scheduler trigger is currently disabled due to lack of regularly updated datasets available in the public domain

### 4. BigQuery
**Purpose:** BigQuery serves as the platform for executing complex SQL queries for insights on rent and sale prices across cities.

### 5. Cloud DBT
**Purpose:**
Cloud DBT is used to build and test data transformation pipelines in the cloud, structuring raw data into clean formats with advanced calculations like percentiles and medians.

**Challenges & Solution:**
Due to synchronization issues during the trial period, which required frequent manual restarts of the Streamlit app, I decided to use pre-processed CSV files for stability. This allowed for smoother integration and ensured that the app could function effectively without relying on real-time data syncing. The transformed data is stored in CSV format and loaded into the Streamlit app for visualization, ensuring a stable and responsive experience.

### 6. Streamlit
**Purpose:**  
Streamlit is used to create an interactive dashboard for visualizing data in real time. In this project, Streamlit serves as the front-end application that displays real estate market activity, price trends, and other key metrics, making it easy for users to explore and analyze the data.

**Key Features:**
- **Interactive visualizations**: Create interactive charts, graphs, and tables to visualize trends in rental and sales data. Users can easily explore comparisons between sales and rental prices, as well as key percentiles like the median and 95th percentile.
- **Real-time filtering**: Allows users to filter data based on cities, price ranges, or market types (Sale vs Rent).
- **Multiple chart types**: Includes line charts for percentiles comparison, bar charts for price comparisons, and time series for price dynamics. Users can visualize data based on several parameters and make data-driven decisions.
- **Dynamic updates**: The dashboard updates in real time as users change the filters, providing an interactive and engaging experience.
- **Data-driven decisions**: The app empowers users to analyze the real estate market trends in Poland, guiding data-driven decisions on pricing and market activity.

### 7. Pandas
   Purpose: Manipulate and clean CSV data for analysis.
   Features
   Market Activity by City: View rental and sale prices, including percentiles and averages.
   Rent vs. Sale Comparison: Analyze how rental and purchase prices differ across cities.
   Market Dynamics: Track price changes over time.

###   How to Run Locally
Just open streamlit app https://polish-flats-ps.streamlit.app/
or
   Clone the repository:
   git clone https://github.com/elgrassa/Data-engineering-professional-certificate.git
   cd Data-engineering-professional-certificate
   Start PostgreSQL and Kestra:
   docker-compose -p kestra-postgres up -d
   Install dependencies:
   pip install -r requirements.txt
   pip install dbt-bigquery
   ... here is a messy one, didn't documented all steps had to update bashrce and export few variables
   export data from dbtcloud to csv
   Run the Streamlit app(stored in separate repo https://github.com/elgrassa/polish_flats)
   streamlit run streamlit_app.py
   Open the app at http://localhost:8501.

### Data Sources
The data used in this project is sourced from [Kaggle](https://www.kaggle.com/datasets/krzysztofjamroz/apartment-prices-in-poland)
and consists of rental and sale price listings for Polish apartments.

![img_1.png](img_1.png)
**Note:** Some cities, such as Bydgoszcz, Gdynia, and Szczecin, have limited data available due to their smaller real estate markets. As a result, you may notice incomplete visualizations or gaps in the data for these locations.

###    Future Improvements
   Add dynamic filters for cities and price ranges.
   Implement time-series forecasting for price trends.
   Add charts/graphs for wife, requested to replace some tables 
### Conclusion
This dashboard simplifies the analysis of Poland's dynamic rental market.
While it offers visualizations and insights, there are areas for improvement, particularly around
the user interface and incorporating more dynamic filters. 
Future updates may include integrating time-series forecasting and more sophisticated data filtering options to enhance usability.
