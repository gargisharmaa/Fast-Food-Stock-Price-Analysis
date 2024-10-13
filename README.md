# Fast Food Stock Market Analysis

This project is designed to analyze stock market data for various fast food companies. It involves fetching historical and real-time stock data, inserting this data into a SQL database, and using Power BI to create a dashboard for visualization.

## Features

- **Data Ingestion**: Load historical stock data from CSV files into a MySQL database.
- **Real-Time Data Fetching**: Update stock data using Yahoo Finance API.
- **Data Prediction**: Predict future stock prices using the Prophet model.
- **Data Visualization**: Connect the SQL database to Power BI to create interactive dashboards.

## Prerequisites

Ensure you have the following installed:

- Python 3.x
- MySQL server
- Power BI for visualization

## Installation

1. **Clone the repository:**

   ```
   bash
     git clone https://github.com/yourusername/fast-food-stock-analysis.git
     cd fast-food-stock-analysis
   ```

   
## Install the required Python libraries: Run the following command to install all necessary libraries:
```
bash
  pip install -r requirements.txt
```

## Configuration
### Database Setup:
Ensure your MySQL server is running and update the DB_URL in complete.py with your database credentials:
```
python
  DB_URL = 'mysql+pymysql://<username>:<password>@localhost/<database_name>'
```

### CSV Directory:
Update the CSV_DIRECTORY variable in complete.py to point to the directory containing your CSV files:
```
python
  CSV_DIRECTORY = 'C:/path/to/your/csv/files'
```
## Usage
### Load CSV Data into SQL
The script loads historical stock data from CSV files into the SQL database. Run the following command:

### Update Stock Data
The script updates real-time stock data and predicts future prices for the next week.

## Code Explanation and Functionalities

### Database Functions:
`get_sql_engine()`: Creates a connection engine to the SQL database.
`insert_data_to_sql(df, table_name)`: Inserts DataFrame data into specified SQL tables, handling NaN values and formatting.

### Data Processing:
`preprocess_data(file_name, ticker)`: Prepares CSV data by handling dates, missing columns, and adding company identifiers.
`insert_csv_to_sql(file_name, table_name)`: Inserts processed CSV data into SQL tables.

### Data Fetching:
`fetch_historical_data(ticker)`: Retrieves historical stock data from SQL.
`fetch_new_data_from_yfinance(ticker, start_date)`: Downloads new stock data from Yahoo Finance starting from a specific date.
`fetch_real_time_data(ticker, start_date)`: Fetches real-time stock data and formats it for consistency.

### Prediction:
`predict_future_price(ticker, days=7)`: Uses Prophet model to predict future stock prices based on historical data.

### Main Functions:
`load_csv_data_to_sql(csv_directory, tickers)`: Loads initial CSV data into SQL tables.
`update_stock_data(tickers)`: Updates existing stock data with new information and predicts future prices.


## Data Visualization
The SQL database is connected to Power BI to create a dashboard that visualizes the stock data and predictions.

## Contributing
Contributions are welcome! Please fork this repository and submit a pull request with your changes.
