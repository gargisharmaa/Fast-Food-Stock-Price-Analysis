import os
import time
import pandas as pd
from config import CSV_DIRECTORY, TICKERS
from data_preprocessing import insert_csv_to_sql
from database import fetch_historical_data, insert_data_to_sql
from stock_data_fetch import fetch_real_time_data
from prediction import predict_future_price

def load_csv_data_to_sql(csv_directory, tickers):
    for ticker in tickers:
        file_name = os.path.join(csv_directory, f"{ticker}.csv")
        if os.path.exists(file_name):
            insert_csv_to_sql(file_name, ticker.lower())
        else:
            print(f"CSV file for {ticker} not found at {file_name}.")

def update_stock_data(tickers):
    for ticker in tickers:
        # Inserting historical data from CSV into the respective tables
        csv_file = os.path.join(CSV_DIRECTORY, f"{ticker}.csv")
        if os.path.exists(csv_file):
            insert_csv_to_sql(csv_file, ticker)

        historical_data = fetch_historical_data(ticker)

        if historical_data.empty:
            print(f"No historical data found for {ticker}. Skipping update.")
            continue

        last_date = historical_data['Date'].max()
        print(f"Last date for {ticker}: {last_date}")

        new_data = fetch_real_time_data(ticker, last_date + pd.Timedelta(days=1))
        if new_data is not None and not new_data.empty:
            new_data = new_data[new_data['Date'] > last_date.date()]

            if not new_data.empty:
                insert_data_to_sql(new_data, ticker)
                print(f"Inserted new data for {ticker} starting from {new_data['Date'].min()}.")

        # Running prediction for the next 7 days
        prediction = predict_future_price(ticker, days=7)

        if not prediction.empty:
            print(f"Prediction for {ticker}:\n{prediction}")

if __name__ == '__main__':
    # Loading CSV data into the database
    load_csv_data_to_sql(CSV_DIRECTORY, TICKERS)

    # Updating stock data and predicting future prices
    update_stock_data(TICKERS)
