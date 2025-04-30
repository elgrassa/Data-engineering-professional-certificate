## Overview
This project examines the real estate market in Poland, with an emphasis on analyzing rental and sales data across various cities. The main objective is to uncover trends such as price fluctuations and market activities through the use of an interactive Streamlit dashboard.

**Note:** In cities with smaller real estate markets, like Bydgoszcz, Gdynia, and Szczecin, data may be limited. Consequently, you might find gaps or less comprehensive visualizations due to reduced market activity in these areas.

## Accessible via
https://polish-flats-ps.streamlit.app/
![img.png](img.png)

**Tools & Technologies**
### 1. Docker Compose & PostgreSQL
**Purpose**: Establish a local database to handle and store real estate information.  
**Command**:
   ```bash
   docker-compose -p kestra-postgres up -d
   ```

### 2. DBT (Data Build Tool)
**Purpose**: Transform raw data into organized formats suitable for analysis.
   ```bash
   pip install dbt-bigquery
   ```

### 3. Kestra
Used for merging and aggregating 16 CSV files from the folder kestra/csv regarding rental and sale data
sourced from [dataset](https://www.kaggle.com/datasets/krzysztofjamroz/apartment-prices-in-poland):

![img_1.png](img_1.png)

**Purpose:**
Automate data pipelines for the extraction, transformation, and loading (ETL) processes into PostgreSQL and BigQuery.  
**Note**: The scheduler trigger is disabled at this time due to the lack of regularly updated datasets available publicly.

### 4. BigQuery
**Purpose:** This platform is utilized for executing intricate SQL queries to gain insights into rental and sales 
prices across different cities.

### 5. Cloud DBT
**Purpose:**
Cloud DBT facilitates the building and testing of data transformation pipelines in the cloud, converting raw 
data into clean formats and enabling complex calculations like percentiles and medians.

**Challenges & Solution:**
During the trial period, synchronization issues necessitated frequent manual restarts of the Streamlit app. 
To address this, I opted for pre-processed CSV files to enhance stability. This approach allowed for smoother 
integration and ensured the app could operate effectively without relying on real-time data synchronization.
The transformed data, stored in CSV format, is loaded into the Streamlit app for visualization, ensuring a stable
and responsive experience.

### 6. Streamlit
**Purpose:**  
Streamlit is employed to develop an interactive dashboard that visualizes data in real time. 
It displays the activity in the real estate market, price trends, and other essential metrics,
making it easy for users to explore and analyze the data.

**Key Features:**
- **Interactive visualizations**: Develop interactive charts, graphs, and tables to illustrate trends in rental and sales data. Users can easily explore price comparisons and other key metrics, such as medians and percentiles.
- **Real-time filtering**: This feature allows users to filter data based on specific cities, price ranges, and market types (Sale vs. Rent).
- **Multiple chart types**: The dashboard will include line charts for percentile comparisons, bar charts for price comparisons, and time series charts for tracking price changes over time. Users can visualize data from various angles and make informed decisions.
- **Dynamic updates**: The dashboard refreshes in real time as users modify filters, ensuring an interactive experience.
- **Data-driven decisions**: This application empowers users to investigate real estate market trends in Poland, assisting in making informed decisions about pricing and market activities.

### 7. Pandas
**Purpose**: To manipulate and clean CSV data for analysis.
**Features**
- Market Activity by City: Observing rental and sale prices, encompassing percentiles and averages.
- Rent vs. Sale Comparison: Examining the differences in rental and purchase prices across cities.
- Market Dynamics: Monitoring price changes over time.

### How to Run Locally
To get started, you can either open the Streamlit app by using the following link:
https://polish-flats-ps.streamlit.app/, or you can clone the repository with these commands:

```bash
git clone https://github.com/elgrassa/Data-engineering-professional-certificate.git
cd Data-engineering-professional-certificate
```

Next, you'll need to start PostgreSQL and Kestra using Docker:

```bash
docker-compose -p kestra-postgres up -d
```

After that, make sure to install the required dependencies:

```bash
pip install -r requirements.txt
pip install dbt-bigquery
```

**Important:** Don't forget to update your `.bashrc` and export the necessary variables as indicated in the execution 
warnings. Some steps, particularly for bash configurations, might not be fully documented.

### Create a DBT Cloud Project
1. Sign in to DBT Cloud and access your dashboard.
2. Click on "Create a New Project" and go through the setup steps.

### Add Connection to BigQuery
1. Navigate to Project > Settings > Connections in DBT Cloud.
2. Choose Google BigQuery as your data warehouse.
3. Upload the JSON key you obtained from Google Cloud for authentication. This step is crucial for securing the
4. connection to your BigQuery project.

**Specify the Project and Dataset:**
- Input the BigQuery project ID and the dataset that DBT should use. Ensure that the correct project and dataset 
- are selected to access your data appropriately.

### Export Transformed Data as CSV
After configuring your DBT Cloud project and the BigQuery connection, go to your DBT Cloud project.

### Export Data
Once you run the transformations, access the BigQuery Console. Navigate to the dataset where your transformed data resides.

### Export to CSV
To export the BigQuery tables to CSV, select the desired table and choose "Export" followed by
"Export to Google Cloud Storage" or opt for "Download as CSV" directly.

### Import CSV Data into Streamlit
After exporting the transformed data as CSV files, load these files into the Streamlit app for visualization.
Make sure to use the exported file names and update the paths in your code to reflect the latest exported CSVs.

You can run the Streamlit app with the updated CSV files (stored in a separate repository):

```bash
streamlit run streamlit_app.py
```
Then open the app at http://localhost:8501.

### Data Sources
The data utilized in this project is from [Kaggle](https://www.kaggle.com/datasets/krzysztofjamroz/apartment-prices-in-poland), 
featuring rental and sale price listings for apartments in Poland.

![img_1.png](img_1.png)

**Note:** Certain cities, like Bydgoszcz, Gdynia, and Szczecin, may have limited data due to their smaller real
estate markets. Therefore, you might encounter incomplete visualizations or data gaps for these areas.

### Future Improvements
- Introduce dynamic filters for cities and price ranges.
- Implement time-series forecasting for price trends.
- Incorporate charts/graphs as requested, to replace some tables.

### Conclusion
This dashboard offers a streamlined way to analyze the fluctuating rental market in Poland. While it provides
valuable visual insights, improvements can be made, especially regarding the user interface and dynamic filtering 
capabilities. Future enhancements may involve integrating time-series forecasts and advanced data filtering options
to improve user experience.
