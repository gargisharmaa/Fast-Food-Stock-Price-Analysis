from sqlalchemy import create_engine
import pandas as pd
from config import DB_URL

def get_sql_engine():
    return create_engine(DB_URL)

def insert_data_to_sql(df, table_name):
    engine = get_sql_engine()
    table_name = table_name.lower()

    # Handling NaN values
    if df.isnull().values.any():
        print(f"Warning: NaN values detected in DataFrame for table '{table_name}'.")
        df.fillna(0, inplace=True) 

    # Formating the 'Close' column to two decimal places for price data
    if 'Close' in df.columns:
        df['Close'] = df['Close'].apply(lambda x: f"{x:.2f}" if pd.notnull(x) else 0)

    try:
        with engine.connect() as conn:
            df.to_sql(table_name, con=conn, if_exists='append', index=False)
    except Exception as e:
        print(f"Error inserting data into table '{table_name}': {e}")

def fetch_historical_data(ticker):
    engine = get_sql_engine()
    query = f"SELECT Date, Close, Volume FROM `{ticker.lower()}` ORDER BY Date"

    try:
        historical_data = pd.read_sql(query, engine)

        if historical_data.empty:
            print(f"No historical data found for {ticker}.")
            return pd.DataFrame()

        historical_data['Date'] = pd.to_datetime(historical_data['Date'], errors='coerce')
        historical_data.dropna(subset=['Date'], inplace=True)
        return historical_data
    except Exception as e:
        print(f"Error fetching historical data for {ticker}: {e}")
        return pd.DataFrame()