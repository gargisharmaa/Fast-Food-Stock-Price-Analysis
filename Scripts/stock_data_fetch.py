import pandas as pd
import yfinance as yf


def fetch_new_data_from_yfinance(ticker, start_date):
    try:
        df = yf.download(ticker, start=start_date, progress=False)
        df.reset_index(inplace=True)
        df['Month'] = df['Date'].dt.month
        df['Quarter'] = df['Date'].dt.quarter
        df['Adj_Close'] = df.get('Adj Close', df['Close'])
        df['Company'] = ticker

        df.rename(columns={'Adj Close': 'Adj_Close'}, inplace=True)
        return df[['Date', 'Open', 'High', 'Low', 'Close', 'Adj_Close', 'Volume', 'Month', 'Quarter', 'Company']]
    except Exception as e:
        print(f"Error fetching data from yfinance for {ticker}: {e}")
        return pd.DataFrame()

def fetch_real_time_data(ticker, start_date):
    try:
        data = yf.download(ticker, start=start_date, progress=False)
        data.reset_index(inplace=True)
        data['Date'] = data['Date'].dt.date  # Converting to date for consistency
        data['Adj_Close'] = data.get('Adj Close', data['Close'])
        data['Month'] = pd.to_datetime(data['Date']).dt.month
        data['Quarter'] = pd.to_datetime(data['Date']).dt.quarter
        data['Company'] = ticker

        return data[['Date', 'Open', 'High', 'Low', 'Close', 'Adj_Close', 'Volume', 'Month', 'Quarter', 'Company']]
    except Exception as e:
        print(f"Error fetching data for {ticker}: {e}")
        return None