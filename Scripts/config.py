import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Database configuration
DB_URL = os.getenv('DB_URL')
CSV_DIRECTORY = os.getenv('CSV_DIRECTORY')
TICKERS = ['BRK-A', 'DNUT', 'DPZ', 'LKNCY', 'MCD', 'PZZA', 'QSR', 'SBUX', 'WEN', 'YUM']